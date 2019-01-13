require './lib/user.rb'
require './lib/message.rb'
require 'capybara/rspec'


feature "Homepage " do
	scenario "homepage exists" do
		visit '/'
		expect(page).to have_content("Chitter")
		expect(page).to have_content("Peeps")
  end
end
    