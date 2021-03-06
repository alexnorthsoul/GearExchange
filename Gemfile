source 'https://rubygems.org'

ruby '2.1.6'

# -------------------- RAILS --------------------
gem 'rails', '4.2.4'

# -------------------- DB -----------------------
gem 'pg'

# -------------------- UI -----------------------
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'foundation-rails'
gem 'font-awesome-rails'
gem 'slim-rails'

# -------------------- API ----------------------
gem 'jbuilder', '~> 2.0'

# ------------------- TOOLS ---------------------
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'rails-i18n'
gem 'babosa'

# ------------------- ACRH ----------------------
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook', '1.5.0' # new versions doesnt work correctly (1.6.0, 2.0.0, 2.0.1)
gem 'omniauth-github'
gem 'simple_form'
gem 'flutie'
gem 'kaminari'
gem 'inline_svg'
gem 'breadcrumble'
gem 'awesome_nested_set'
gem 'ransack'
gem 'friendly_id'
gem 'acts_as_commentable'
gem 'acts_as_votable'

# --------------- PRODUCTION---------------------
group :production do
  gem 'rails_12factor'
end

# --------------- DEV & TEST---------------------
group :development, :test do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'pry-rails'
  gem 'did_you_mean'
  gem 'fuubar'
  gem 'quiet_assets'
  gem 'rspec-rails'
  gem 'byebug'
end

group :test do
  gem 'simplecov', require: false
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'database_cleaner', git: 'https://github.com/DatabaseCleaner/database_cleaner.git'
end
