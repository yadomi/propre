require 'json'
require 'colorize'

require 'propre/dictionary'

module Propre
  def self.propify(arg)
    ban_words(ban_chars(sanitize(remove_patterns(arg.downcase)))).split.map(&:capitalize).join(' ')
  end

  def self.find_urls(arg)
    arg = arg.match '((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[.\!\/\\w]*))?)'
    arg.to_s
  end

  def self.find_years(arg)
    arg = arg.match '((19|20)\d\d)'
    arg.to_s
  end

  def self.find_episode(arg)
    arg = arg.match '(s\d{1,2}e\d{2,3})'
    arg.to_s
  end

  def self.remove_patterns(arg)
    arg.slice! find_urls(arg)
    arg.slice! find_years(arg)
    arg.slice! find_episode(arg)
    arg
  end

  def self.sanitize(arg)
    if arg.count('.') > arg.count('-')
      arg.gsub('.', ' ').strip
    else
      arg.gsub('-', ' ').strip
    end
  end

  def self.ban_chars(arg)
    arg.tr('^A-Za-z0-9 ', '').strip
  end

  def self.ban_words(arg)
    banned_words = Dictionary.constants.reduce([]) do |sum, e|
      sum.concat Dictionary.const_get(e)
    end
    arg.split.each do |word|
      banned_words.select do |e|
        arg.slice! word if word.include? e
      end
    end
    arg.squeeze(' ')
  end

  def self.metadata(arg)
    arg = arg.downcase
    {
      year: find_years(arg),
      episode: find_episode(arg).upcase,
      website: find_urls(arg)
    }
  end

  def self.format(newname, metadata)
    metadata[:newname] = newname
    metadata[:year] = "(#{metadata[:year]})" unless metadata[:year].empty?

    format = '%{newname} %{episode} %{year}'
    formated = format % metadata
    formated.strip.squeeze(' ')
  end

  def self.basename_newname_metadata(arg)
    basename = File.basename(arg, File.extname(arg))
    [basename, format(propify(basename), metadata(basename)), metadata(basename)]
  end
end
