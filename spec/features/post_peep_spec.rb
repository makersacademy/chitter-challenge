feature 'posting peeps' do
	scenario 'user can post a peep and see it appear in list of peeps' do
		visit('/')
		fill_in :peep_message, with: "Its a fine day to be a Maker"
		click_button "Post"
		expect(page).to have_content "Its a fine day to be a Maker"
		expect(page).to have_content 
	end
end
