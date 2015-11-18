source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails', '4.2.4'

gem 'autoprefixer-rails'
gem 'bootstrap-sass'
gem 'devise'
gem 'jquery-rails'
gem 'puma'
gem 'rack-timeout' # Heroku and puma
gem 'simple_form'
gem 'turbolinks'

gem 'sass-rails'
gem 'slack-ruby-client'
gem 'grape'
gem 'hashie-forbidden_attributes'
gem 'masonry-rails'
gem 'state_machine', git: 'git://github.com/seuros/state_machine.git'

group :assets do
  gem 'sassc-rails'
  gem 'uglifier', '>= 1.3.0'
end

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'thin'
end

group :development, :test do
  gem 'factory_girl_rails', '~> 4.4.1'
  gem 'guard'
  gem 'guard-livereload'
  gem 'guard-rspec'
  gem 'letter_opener'
  gem 'pry'
  gem 'rspec-rails', '~> 3.1.0'
  gem 'spring'
  gem 'web-console', '~> 2.0'
end

group :staging, :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :test do
  gem 'capybara', '~> 2.4.3'
  gem 'database_cleaner', '~> 1.3.0'
  gem 'faker', '~> 1.4.3'
  gem 'shoulda-matchers', require: false
end
