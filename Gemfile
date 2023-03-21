source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails'
gem 'pg'
gem 'slim'
gem 'sqlite3'

gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'globalid', '~> 1.0'
gem 'net-smtp', require: false
gem 'net-imap', require: false
gem 'net-pop', require: false

gem 'bootsnap', '>= 1.4.2', require: false
gem 'activeadmin'
gem 'bootstrap-sass'
gem 'jquery-rails'
gem 'devise'
gem 'cancancan'
gem 'draper'
gem 'pundit'
gem 'paperclip'
gem 'psych', '< 4'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 4.1.0'
  gem 'factory_bot_rails'
  gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'main'
  gem 'rails-controller-testing'
  gem 'warden-rspec-rails'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'database_cleaner', '~> 1.8'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry', '~> 0.13.1'
  gem 'meta_request'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
