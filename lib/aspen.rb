require_relative '../config/environment'

class Aspen

  def self.directories
    @@directories
  end

  def self.method_missing(method, *args, &block)
    puts "Invalid command - try again."
  end

  def self.help
    File.open(File.join(AspenRoot, "/help/help.txt")).each_line do |line|
      puts line
    end
  end

  def self.run(args)
    if args[0].strip.downcase == '--help' 
      return help
    end
    return method_missing(:run, args) if args == nil
    @@root_name = sterilize_project_name(args)
    return if @@root_name == nil
    @@directories = AspenTemplate.tree(TEMPLATE)
    project_init
  end

  def self.project_init
    directory_init
    rspec_init
    make_files
    successful_creation
    write_to_files
  end

  def self.directory_init
    self.directories.each {|dir| FileUtils.mkdir_p("#{@@root_name}#{dir}", :verbose => true)}
  end

  def self.rspec_init
    current = FileUtils.pwd()
    FileUtils.cd("#{@@root_name}")
    RSpec::Core::ProjectInitializer.new.run  
    FileUtils.cd(current)
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

  def self.sterilize_project_name(args)
    name = (args.size == 1 ? args.first : args.join(" "))
    if name.match(/^[a-z]/i)
      @@project_name = name
      name.strip.downcase.gsub(/[\s\_]/,"-")
    else
      puts "Invalid project name: #{name}"
    end
  end
end