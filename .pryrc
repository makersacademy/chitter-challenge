require 'capybara/dsl'
require 'selenium-webdriver'
Capybara.default_driver = :selenium
include Capybara::DSL

describe do
	it do
    binding.pry
  end
end
