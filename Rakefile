#!/usr/bin/env rake

begin
  require "bundler/setup"
  require "bundler/gem_tasks"
rescue LoadError
  puts "You must `gem install bundler` and `bundle install` to run rake tasks"
end
require "rspec/core/rake_task"

desc "Run all the tests in spec"
RSpec::Core::RakeTask.new(:spec)

desc "Default: run tests"
task default: :spec
