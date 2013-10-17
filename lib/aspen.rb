require_relative '../config/environment'

class Aspen

  @@mono_flags = [:git]

  @@args = Trollop::Parser.new do
    opt :git, "Initialize a git repository"
    opt :template, "Specify a template structure", :type => :string 
    opt :name, "Specify project name", :type => :strings                   
  end

  @@opts = Trollop::with_standard_exception_handling @@args do
    raise Trollop::HelpNeeded if ARGV.empty? || !ARGV[0].start_with?("-")
    @@args.parse ARGV
  end

  def self.directories
    @@directories
  end

  def self.help
    raise Trollop::HelpNeeded
  end

  def self.run
    @@root_name = sterilize_project_name(@@opts[:name])
    @@directories = AspenTemplate.tree(TEMPLATE)
    project_init
  end

  def self.gem_init
    current = FileUtils.pwd()
    FileUtils.cd("#{@@root_name}")
    yield 
    FileUtils.cd(current)
  end

  def self.git
    gem_init { Git.init }
  end

  def self.process_flags
    @@mono_flags.each do |flag|
      if @@opts[flag] == true
        self.send(flag)
      end
    end
  end

  def self.rspec_init
    gem_init { RSpec::Core::ProjectInitializer.new.run }
  end

  def self.project_init
    directory_init
    rspec_init
    make_files
    successful_creation
    write_to_files
    process_flags
  end

  def self.directory_init
    self.directories.each {|dir| FileUtils.mkdir_p("#{@@root_name}#{dir}", :verbose => true)}
  end

  def self.make_files
    FileUtils.touch("#{@@root_name}/README.md")
    FileUtils.touch("#{@@root_name}/config/environment.rb")
  end

  def self.write_to_files
    File.open("#{@@root_name}/README.md", "w+") do |f|
      f << "###{@@project_name}\n*thanks for using aspen - happy coding!*"
    end
  end

  def self.successful_creation
    puts "\nProject successfully created at:\n\t#{Dir.pwd}/#{@@root_name}\n"
  end

  def self.sterilize_project_name(name)
    name = name.join(" ")
    if name.match(/^[a-z]/i)
      @@project_name = name
      name.strip.downcase.gsub(/[\s\_]/,"-")
    else
      puts "Invalid project name: #{name}"
    end
  end
end