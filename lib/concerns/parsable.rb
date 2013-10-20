module Parsable

  @mono_flags = [:git]

  @args = Trollop::Parser.new do
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

  @opts = Trollop::with_standard_exception_handling @args do
    temp_args = @args.parse ARGV
    raise Trollop::HelpNeeded if ARGV.empty? || @args.leftovers.size == 0
    temp_args
  end

  def self.sterilize_project_name(name)
    name = name.join(" ")
    if name.match(/^[a-z]/i)
      @project_name = name
      name.strip.downcase.gsub(/[\s\_]/,"-")
    else
      puts "Invalid project name: #{name}"
    end
  end

  @root_name = sterilize_project_name(@args.leftovers)

  def self.process_flags
    @mono_flags.each do |flag|
      if @opts[flag] == true
        self.send(flag)
      end
    end
  end

  def self.load_template
    if @opts[:template] == nil
      require_relative "#{AspenRoot}/lib/templates/default.rb"
    else
      Dir.foreach("#{AspenRoot}/lib/templates") do |file|
        if file.start_with?("#{@opts[:template].downcase.strip}")
          require_relative "#{AspenRoot}/lib/templates/#{file}"
          break
        end
      end
    end
  end
  

end