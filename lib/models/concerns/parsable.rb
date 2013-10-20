module Parsable

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

  def self.process_flags
    @@mono_flags.each do |flag|
      if @@opts[flag] == true
        self.send(flag)
      end
    end
  end

end