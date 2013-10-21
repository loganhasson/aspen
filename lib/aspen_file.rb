require_relative '../config/environment'

class AspenFile

  attr_reader :direc, :file, :templ

  @@all = []

  def self.all
    @@all
  end

  def initialize(templ, direc, file)
    @templ = templ
    @direc = direc
    @file = file
    @@all << self
  end

  def create(root)
    FileUtils.cp("#{self.templ}/#{self.file[0]}", "#{root}#{self.direc}/#{self.file[0]}")
  end

end