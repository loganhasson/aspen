require_relative '../config/environment'

class AspenFile

  attr_reader :direc, :file, :templ

  @@all = []

  def self.all
    @@all
  end

  def initialize(templ, direc, file)
    @templ = templ
    if direc.length != 0
      @direc = direc + "/" 
    else
      @direc = ""
    end
    @file = file
    @@all << self
  end

  def create(root)
    FileUtils.cp("#{self.templ}/#{self.file[0]}", "#{root}/#{self.direc}#{self.file[0]}")
    puts "  create   #{self.direc.sub('/','')}#{self.file[0]}"
  end

end