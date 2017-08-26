require_relative "../../app/app"
require_relative "../../app/models/peep"
require 'spec_helper'

RSpec.feature "Posts page" do
	scenario "Check if you have posts in the page" do
		Peep.create(user: "Panda", text: "This is the first post ever on Chitter.")
		visit "/posts"
		expect(page.status_code).to eq 200
		within "ul#peeps" do
			expect(page).to have_content("This is the first post ever on Chitter.")
		end
	end
end