source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'httparty', '>= 0.17.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'pry', '~> 0.12.2'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.3'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.8'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'simplecov', require: false, group: :test

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
