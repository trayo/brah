require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end

task :default => :test

desc "Build the docker image"
task :docker_build do
  gem_version=`cat lib/brah/version.rb`.match(/\d\.\d\.\d/)[0]
  puts %x[docker build --build-arg GEM_VERSION=#{gem_version} -t brah .]
end
task :docker_build_image => :docker_build

desc "Run brah to check it's installed"
task :docker_run do
  puts %x[docker run -it --rm brah brah -h]
end
