# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_experience_drop_ship'
  s.version     = '3.0.7'
  s.summary     = 'spree_experience_drop_ship summary'
  s.description = 'spree_experience_drop_ship description'
  s.required_ruby_version = '>= 2.0.0'

   s.author    = 'chandana'
   s.email     = 'nc.chandana@gmail.com'
  s.homepage  = 'https://github.com/maheshgowda/spree_experience_drop_ship'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'
  
  s.add_dependency 'durable_decorator', '~> 0.2.0'
  s.add_dependency 'spree_api'
  s.add_dependency 'spree_backend'
  s.add_dependency 'spree_core', '~> 3.0.7'

  s.add_development_dependency 'capybara', '~> 2.4'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 3.1'
  s.add_development_dependency 'sass-rails', '~> 5.0.0.beta1'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
