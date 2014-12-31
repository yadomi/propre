require 'yaml'
require 'parseconfig'

class Settings

  def initialize(path)
    @path = path
    if !File.exist?(path) then FileUtils.touch(path) end
    conf = YAML.load_file(path)
    @settings = conf ? conf : Hash.new
  end

  def get(key)
    @settings[key]
  end

  def set(key, value)
    @settings[key] = value
    File.open(@path, 'w') { |f| YAML.dump(@settings, f) }
  end

end