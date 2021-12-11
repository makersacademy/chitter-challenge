
feature "creating a peep" do
	scenario "User can create a peep/message" do
		visit '/peeps/new'

		fill_in "message", with: 'First time posting in Chitter!'
		click_button "Send"

		expect(page).to have_content 'First time posting in Chitter!'

	end
end