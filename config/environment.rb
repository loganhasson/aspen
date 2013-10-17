require 'fileutils'
require 'rspec'
require 'pry'

AspenRoot = File.expand_path(File.dirname(__FILE__)).gsub("/config", "")
#binding.pry

Dir.foreach(AspenRoot) do |file|
  next if file.start_with?('.')
  if File.directory?("#{AspenRoot}/#{file}")
    Dir.foreach("#{AspenRoot}/#{file}") do |f|
      next if f.start_with?('.') || f.start_with?("environment.rb")
      require_relative "#{AspenRoot}/#{file}/#{f}" if f.end_with?(".rb")
      puts f
    end
  end
end
