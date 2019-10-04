source 'https://rubygems.org'
ruby '2.6.3'

# Distribute your app as a gem
# gemspec

# Server requirements
# gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Optional JSON codec (faster performance)
# gem 'oj'

# open-data-maker requirements
gem 'elasticsearch'
gem 'typhoeus'
gem 'stretchy'
gem 'hashie'
gem 'cf-app-utils'
#gem 'unicorn'
gem 'puma'
gem 'safe_yaml'
gem 'aws-sdk', '~> 2'
gem 'actionview'
gem 'dotenv'
gem 'oj'
gem 'parslet'
gem 'parallel'

# Project requirements
gem 'rake'

# Component requirements
gem 'sass'
gem 'liquify'
gem 'liquid', '= 3.0.3'
gem 'erubis'

# Test requirements
group :test do
  gem 'rspec'
  gem 'rspec-mocks'
  gem 'rack-test', :require => 'rack/test'
  gem 'rspec_junit_formatter'
  gem 'simplecov', require: false
end

group 'dev' do
  gem 'ruby-prof'

end
# Padrino Stable Gem
gem 'padrino', '0.13.3.4'

gem 'pry'
gem 'pry-byebug', :group => ['development', 'test']
gem 'newrelic_rpm'

# Or Padrino Edge
# gem 'padrino', :github => 'padrino/padrino-framework'

# Or Individual Gems
# %w(core support gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.12.5'
# end
