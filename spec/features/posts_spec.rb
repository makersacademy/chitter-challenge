require_relative "../../app/app"
require_relative "../../app/models/peep"
require 'spec_helper'

RSpec.feature "Posts page" do
	scenario "Check if the field 'User' is displayed in the page" do
		Peep.create(user: "Panda")
		visit "/posts"
		expect(page.status_code).to eq 200
		within "ul#peeps" do
			expect(page).to have_content("User: Panda")
		end
	end
	scenario "Check if the field 'Peep' is displayed in the page" do
		Peep.create(text: "This is the first post ever on Chitter.")
		visit "/posts"
		expect(page.status_code).to eq 200
		within "ul#peeps" do
			expect(page).to have_content("Peep: This is the first post ever on Chitter.")
		end
	end
	scenario "Check if the field 'Posted at' is displayed in the page" do
		Peep.create(created_at: "12:30")
		visit "/posts"
		expect(page.status_code).to eq 200
		within "ul#peeps" do
			expect(page).to have_content("Posted at: 12:30")
		end
	end
end