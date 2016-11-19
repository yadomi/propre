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

  def self.find_language(arg)
    Dictionary::LANGUAGES.find { |e| arg.include?(e) } || ''
  end

  def self.find_quality(arg)
    Dictionary::QUALITY.find { |e| arg.include?(e) } || ''
  end

  def self.remove_patterns(arg)
    %w(find_urls find_years find_episode find_language find_quality).each do |m|
      arg.slice! method(m).call(arg)
    end
    arg
  end

  def self.sanitize(arg)
    separator = %w(- _ .).each_with_object({}) { |c, s| s[c] = arg.count(c) }
                .sort_by(&:last).reverse.first.first
    arg.gsub(separator, ' ').strip.sub(/\[.*?\]/, '')
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
      website: find_urls(arg),
      language: find_language(arg),
      quality: find_quality(arg)
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
