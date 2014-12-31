require 'highline/import'

module Prompt

  def Prompt.yesno(prompt = 'Continue?', default = false)
    a = ''
    s = default ? '[Y/n/s]' : '[y/N/s]'
    d = default ? 'y' : 'n'
    until %w[y n s].include? a
      a = ask("#{prompt} #{s} ") { |q| q.limit = 1; q.case = :downcase }
      a = d if a.length == 0
    end
    if a == 'y'; true elsif a == 's'; 'skip' else false end
  end

end