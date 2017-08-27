require_relative "../../app/app"
require_relative "../../app/models/peep"
require_relative "../../app/models/user"
require 'spec_helper'

RSpec.feature "New peep page" do
	scenario "Check if the field 'Peep' is displayed in the page" do
		visit "/new"
		fill_in("text", with: "This is the first post ever on Chitter.")
		click_button("Peep!")
		expect(page.status_code).to eq 200
		expect(page).to have_text("This is the first post ever on Chitter.")
	end

end