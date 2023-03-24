# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'pg'
gem 'rails'
gem 'slim'
gem 'sqlite3'

gem 'globalid', '~> 1.0'
gem 'jbuilder', '~> 2.7'
gem 'net-imap', require: false
gem 'net-pop', require: false
gem 'net-smtp', require: false
gem 'puma', '~> 4.1'
gem 'sassc-rails'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

gem 'activeadmin'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'bootstrap-sass'
gem 'cancancan'
gem 'devise'
gem 'draper'
gem 'jquery-rails'
gem 'paperclip'
gem 'psych', '< 4'
gem 'pundit'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'database_cleaner', '~> 1.8'
  gem 'factory_bot_rails'
  gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'main'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 4.1.0'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'warden-rspec-rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '~> 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'meta_request'
  gem 'pry', '~> 0.13.1'
  gem 'rubocop-rspec', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
