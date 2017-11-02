
#!/usr/bin/env ruby

$:.push File.expand_path(File.join("..", "lib"), __FILE__)
require "jsonapi/resources/home/version"

Gem::Specification.new do |spec|
  spec.name = "jsonapi-resources-home"
  spec.version = JSONAPI::Resources::Home::VERSION
  spec.authors = ["Kurtis Rainbolt-Greene"]
  spec.email = ["kurtis@rainbolt-greene.online"]
  spec.summary = %q{An early implementation of JSONAPIHome, a fork of JSONHome}
  spec.description = spec.summary
  spec.homepage = "http://krainboltgreene.github.io/jsonapi-resources-home"
  spec.license = "ISC"

  spec.files = Dir[File.join("{app,config,db,lib}", "**", "*"), "LICENSE", "README.md", "Rakefile"]
  spec.executables = Dir[File.join("bin", "**", "*")].map { |f| f.gsub(/bin\//, "") }
  spec.test_files = Dir[File.join("test", "**", "*"), File.join("spec", "**", "*")]

  spec.add_development_dependency "bundler", "1.15.4"
  spec.add_development_dependency "rspec", "3.7.0"
  spec.add_development_dependency "rake", "12.2.1"
  spec.add_development_dependency "pry", "0.11.2"
  spec.add_development_dependency "pry-doc", "0.11.1"
  spec.add_development_dependency "sqlite3", "1.3.13"
  spec.add_runtime_dependency "rails", "5.1.4"
  spec.add_runtime_dependency "jsonapi-resources", "0.9.0"
end
