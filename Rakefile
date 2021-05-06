require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["tests/**/*_test.rb"]
end

Rake::TestTask.new(:server) do |t|
  sh "rerun 'bundle exec ruby web.rb'"
end

task :default => :test
