source 'https://rubygems.org'

ruby '2.4.0'

gem 'rake'
gem 'hanami',       '1.0.0.beta1'
gem 'hanami-model', '~> 1.0.0.beta1'

gem 'pg'

gem 'slack-ruby-bot'
gem 'celluloid-io'

gem 'tapp', git: 'https://github.com/5t111111/tapp.git', branch: 'add-decoration-feature'
gem 'pry-byebug'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun'
end

group :test, :development do
  gem 'dotenv', '~> 2.0'
end

group :test do
  gem 'minitest'
  gem 'capybara'
end

group :production do
  # gem 'puma'
end
