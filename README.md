## added gems

```
group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'capybara'
end
```
## install rspec
bin/rails rspec:install

## run tests
bundle exec spring binstub --all

## RUN tests
bin/rspec


## YARN
yarn add jquery
yarn add boostrap

## other gems
gem 'simple_form'
bin/rails g simple_form:install --bootstrap

