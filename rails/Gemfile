source 'https://rubygems.org'


#gem 'rails',                   '4.2.0.beta4'
#currently there are some issues with Rails 4.2. and the Active Record Serializer
gem 'rails', '4.1.6'
gem "active_model_serializers", "0.9.0"

gem 'devise'
#used for password migration
gem 'bcrypt',                  '3.1.7'
gem 'faker',                   '1.4.2'
gem 'carrierwave',             '0.10.0'
gem 'mini_magick',             '3.8.0'
gem 'fog',                     '1.23.0'
gem 'will_paginate',           '3.0.7'
gem 'bootstrap-will_paginate', '0.0.10'
gem 'bootstrap-sass',          '3.2.0.0'
gem 'sass-rails',              '5.0.0.beta1'
gem 'uglifier',                '2.5.3'
gem 'coffee-rails',            '4.0.1'
gem 'jquery-rails'
#gem 'turbolinks',              '2.3.0'
gem 'jbuilder',                '2.2.3'
#disabling, not sure if we need it or not. 
#gem 'rails-html-sanitizer',    '1.0.1'
gem 'sdoc',                    '0.4.0', group: :doc

#ember support
gem 'ember-rails'
gem 'ember-source'
gem 'emblem-rails'


group :development, :test do
  gem 'sqlite3',     '1.3.9'
  gem 'byebug',      '3.4.0'
  gem 'web-console', '2.0.0.beta3'
  gem 'spring',      '1.1.3'
end

group :test do
  gem 'minitest-reporters', '1.0.5'
  gem 'mini_backtrace',     '0.1.3'
  gem 'guard-minitest',     '2.3.1'
end

group :production do
  gem 'pg',             '0.17.1'
  gem 'rails_12factor', '0.0.2'
  gem 'unicorn',        '4.8.3'
end
