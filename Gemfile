source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Core
gem 'rails', '~> 5.2.4'
# Midware
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
# View
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap4-kaminari-views'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

gem 'carrierwave'
gem 'devise'
gem 'devise-i18n'
gem 'faker'
gem 'kaminari'
gem 'mini_magick'
gem 'ransack'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'launchy'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 4.0.2'
  gem 'spring-commands-rspec'
end

group :development do
  gem 'letter_opener_web'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
