require './lib/user.rb'
require 'capybara/rspec'


feature "Homepage " do
	scenario "homepage exists" do
		visit '/'
		expect(page).to have_content("Chitter")
  end
end
    