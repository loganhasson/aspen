require_relative '../config/environment'

class Aspen

  @@mono_flags = [:git]

  @@args = Trollop::Parser.new do
    version "aspen-0.2.2"
    banner <<-EOS
 -----------------------------------------------------------------------------
|aspen creates a flexible skeleton directory structure for your Ruby projects.|
 -----------------------------------------------------------------------------

Basic Usage:
       aspen <project_name>

Better Usage:
       aspen [options] <project_name>

where [options] are:
EOS
    opt :git, "Initialize a git repository"
    opt :template, "Specify a template structure", :type => :string                   
  end

  @@opts = Trollop::with_standard_exception_handling @@args do
    temp_args = @@args.parse ARGV
    raise Trollop::HelpNeeded if ARGV.empty? || @@args.leftovers.size == 0
    temp_args
  end

  def self.directories
    @@directories
  end

  def self.run
    @@root_name = sterilize_project_name(@@args.leftovers)
    load_template
    @@directories = AspenTemplate.tree(TEMPLATE, "#{AspenRoot}/lib/templates/#{@@opts[:template]}")
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

  def self.load_template
    if @@opts[:template] == nil
      @@opts[:template] = "default"
      require_relative "#{AspenRoot}/lib/templates/default/template.rb"
    else
      Dir.foreach("#{AspenRoot}/lib/templates") do |file|
        if file.start_with?("#{@@opts[:template].downcase.strip}")
          require_relative "#{AspenRoot}/lib/templates/#{file}/template.rb"
          break
        end
      end
    end
  end

  def self.rspec_init
    gem_init { RSpec::Core::ProjectInitializer.new.run }
  end

  def self.project_init
    directory_init
    rspec_init
    make_files if @@opts[:template] == nil || @@opts[:template] == "default"
    successful_creation
    write_to_files
    process_flags
  end

  def self.directory_init
    self.directories.each do |dir|
      FileUtils.mkdir_p("#{@@root_name}#{dir}", :verbose => true)
    end
  end

  def self.make_files
    FileUtils.touch("#{@@root_name}/README.md")
    AspenFile.all.each {|af| af.create("#{@@root_name}") }
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