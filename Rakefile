require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs = ["lib", "build", "test"]
  t.test_files = FileList['test/ruby/*_test.rb']
end

desc "Run tests"
task :default => :test
