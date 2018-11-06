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

## run comand tests
bin/rails rspec:install
bundle exec spring binstub --all

## RUN tests
bin/rspec
