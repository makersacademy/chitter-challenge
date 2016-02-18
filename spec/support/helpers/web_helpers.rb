def visual_debug
require 'capybara/dsl'

Capybara.default_driver = :selenium

include Capybara::DSL

end