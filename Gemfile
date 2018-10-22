# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

ruby '2.5.1'

gem 'rake'
gem 'sinatra'

group :test do
  gem 'capybara'
  gem 'rspec'
  gem 'selenium-webdriver'
  gem 'rubocop'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end
