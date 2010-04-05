require 'rubygems'
require 'rake'
require 'rake/testtask'

task :default => [:test]

desc "Run all tests, test-spec, mocha, and pdf-reader required"
Rake::TestTask.new do |test|
  test.ruby_opts  << "-w"
#  test.libs       << "spec"
  test.test_files =  Dir["spec/*_spec.rb"]
  test.verbose    =  true
end
