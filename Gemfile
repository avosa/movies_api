source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails"
gem "puma"
gem "pg"

gem "httparty"

gem "bootsnap", require: false
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails", "~> 6.0"
  gem "factory_bot_rails", "~> 6.2"
end

group :development do
  gem "rubocop"
end
