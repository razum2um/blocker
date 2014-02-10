require "bundler/gem_tasks"
require 'bundler/setup'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :c do
  require 'pry'
  require 'blocker'
  ARGV.clear
  Pry.start
end

task :default => :spec
