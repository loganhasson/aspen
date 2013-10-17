require 'fileutils'
require 'rspec'
require 'pry'

AspenRoot = File.expand_path(File.dirname(__FILE__)).gsub("/config", "")
#binding.pry


def get_reqs(current_dir)
  Dir.foreach(current_dir) do |file|
    next if file.start_with?('.') or file.start_with?("environment.rb")
    if File.directory?("#{current_dir}/#{file}")
      get_reqs("#{current_dir}/#{file}")
    else
      require_relative "#{current_dir}/#{file}" if file.end_with?(".rb")
      puts "#{current_dir}/#{file}"
    end
  end
end

Dir.foreach(AspenRoot) do |file|
  next if file.start_with?('.')
  get_reqs("#{AspenRoot}/#{file}") if File.directory?("#{AspenRoot}/#{file}")
end