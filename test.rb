require 'fileutils'

class Setup

  def self.run(*args)
    FileUtils.mkdir_p("#{args[0]}", :verbose => true)
    FileUtils.mkdir_p("#{args[0]}/", :verbose => true)
  end

end

Setup.run("Project")