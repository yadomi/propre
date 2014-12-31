require 'propre/prompt'
require 'propre/settings'
require 'propre/version'

require 'fileutils'
require 'themoviedb'
require 'mime/types'

class Propre
  include Prompt
  include Version

  def initialize(options)
    @options = options
    @settings = Settings.new("#{Dir.home}/.config/Propre/settings.yaml")
    if @settings.get('apikey').nil?
      puts "It's seem you didn't set your TMDB API Key (stored in ~/.config/Propre/settings.yaml) \nPlease tell me: "
      @settings.set('apikey', STDIN.gets.chomp())
      puts "Thanks !"
    end
    Tmdb::Api.key(@settings.get('apikey'))
    Tmdb::Api.language(@settings.get('locale') ? @settings.get('locale') : 'en')
  end

  def crawlDirectory(path)
    Dir.foreach(path) do |item|
      next if item == '.' or item == '..'
      if File.directory?(File.join(path, item))
        if @options[:recursive] then self.crawlDirectory(File.join(path, item)) end
      else
        self.searchMovieFromFile(File.join(path, item))
      end
    end
  end

  def searchMovieFromFile(file)
    @file = file
    filename = File.basename(file,File.extname(file))
    if @options[:videonly] && !video?(file)
      return
    end
    if !@options[:dotfile] && filename.start_with?('.')
      return
    end
    if @options[:sanitize] then filename = self.sanitize(filename) end
    @movies = Tmdb::Movie.find(filename)
    if self.confirm
      File.rename(file, File.join(File.dirname(file), self.format(@selected)))
    end
  end

  def confirm()
    @selected = false
    @movies.each do |movie|
      answer = Prompt.yesno("#{File.basename(@file)} -> #{self.format(movie)}")
      if answer === false; next ; elsif answer === 'skip'; puts "Skipping..."; return end
      @selected = movie
      break
    end
    if @selected then @selected end
  end

  def format(movie)
    year = !movie.release_date.empty? ? Date.strptime(movie.release_date, "%Y-%m-%d").year : false
    title = year ? "#{movie.title} (#{year})" : "#{movie.title}"
    title.gsub! ':','-'
    return "#{title}#{File.extname(@file)}"
  end

  def sanitize(filename)
    filename.downcase!
    filename.gsub!(/\(.*\)/, '')
    filename.gsub!("_", ' ')
    filename.gsub!(".", ' ')
    filename.sub!(/(19|20)\d{2}/, '')
    filename.strip!
    warez = ["truefrench","brrip", "ac3-funky", "fansub","bluray","720", "720p", "x264","french", "fr", "divx","hdcam","xvid","appz","bdrip","board","cam","dvd","dvd-r","dvdrip","dupecheck","fake","fs","gamez","hddvd","hddvdrip","hdrip","hdtv","pdtv","internal","int","keygen","leecher","limited","nuke","proper","repack","retail","rip","rip","screener","serial","subforced","hardsub","stv","telecine","telesync","tvrip","unrated","vhsrip","vo","vost","vostfr","workprint","french","wp","subbed","unsubbed", "r5", "r6", "md"]  
    (filename.split - warez).join(' ')
  end

  def video?(file)
    MIME::Types[/^video/].include? MIME::Types.of(file)
  end

end