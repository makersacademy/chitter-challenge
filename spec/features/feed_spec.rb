require_relative "../../app/app"
require_relative "../../app/models/peep"
require_relative "../../app/models/user"
require 'spec_helper'

RSpec.feature "Feed page" do

	scenario "Check if the user is displayed in the page" do
		User.create(username: "Panda")
		visit "/feed"
		expect(page.status_code).to eq 200
		within "ul#peeps" do
			expect(page).to have_content("Panda")
		end
	end

	scenario "Check if the peep is displayed in the page" do
		Peep.create(text: "This is the body of the peep.")
		visit "/feed"
		expect(page.status_code).to eq 200
		within "ul#peeps" do
			expect(page).to have_content("This is the body of the peep.")
		end
	end

	scenario "Check if the time is displayed in the page" do
		Peep.create(created_at: "12:30")
		visit "/feed"
		expect(page.status_code).to eq 200
		within "ul#peeps" do
			expect(page).to have_content("Posted at: 12:30")
		end
	end
end