require 'timecop'

feature 'posting peeps' do
	scenario 'user can post a peep and see it appear in list of peeps' do
		Timecop.freeze(Time.local(2021).to_formatted_s(:db))
		signup
		login
		fill_in :peep_message, with: "Its a fine day to be a Maker"
		click_button "Post"
		expect(page).to have_content "Its a fine day to be a Maker"
		expect(page).to have_content "Posted by Joe Bloggs"
		expect(page).to have_content Time.local(2021).to_formatted_s(:db)
	end

end
