source "https://rubygems.org"

gem "hanami",       "1.0.0.beta2"
gem "hanami-model", "~> 1.0.0.beta2"
gem "rake"

gem "http", "~> 2.2.1"
gem "oga"
gem "pg"

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem "shotgun"
end

group :test, :development do
  gem "dotenv", "~> 2.0"
  gem "pry"
  gem "rubocop", "~> 0.47.1", require: false
end

group :test do
  gem "capybara"
  gem "minitest"
  gem "webmock", "~> 2.3"
end

group :production do
  # gem 'puma'
end
