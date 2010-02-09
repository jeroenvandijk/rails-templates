append_file 'Gemfile', <<-GEMFILE

git 'git://github.com/rspec/rspec.git'
git 'git://github.com/rspec/rspec-core.git'
git 'git://github.com/rspec/rspec-expectations.git'
git 'git://github.com/rspec/rspec-mocks.git'
git 'git://github.com/rspec/rspec-rails.git'

group(:test) do
  gem 'rspec'
  gem 'rspec-core'
  gem 'rspec-expectations'
  gem 'rspec-mocks'
  gem 'rspec-rails'
end
GEMFILE

run('bundle install vendor')

run('vendor/bin/rails generate rspec:install')

apply 'http://github.com/snusnu/rails-templates/raw/rspec/sample_scaffold.rb'

run('rspec spec')
run('vendor/bin/rake spec')
