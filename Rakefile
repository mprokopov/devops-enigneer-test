require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["tests/**/*_test.rb"]
end

task :prod do
  ENV['APP_ENV']="production"
  sh "ruby src/app.rb"
end

task :dev do
  ENV['APP_ENV']="development"
  sh "rerun 'bundle exec ruby src/app.rb'"
end

task :default => :test
