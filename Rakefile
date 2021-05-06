require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["tests/**/*_test.rb"]
end

task :prod do
  sh "ruby web.rb"
end

task :dev do
  sh "rerun 'bundle exec ruby web.rb'"
end

task :default => :test
