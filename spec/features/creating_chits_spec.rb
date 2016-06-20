feature 'creating chits' do
	scenario 'adding a new chit with a text' do
		sign_up
		visit '/chits'
		fill_in :text, with: 'This is an example chit'
		click_button 'Post Chit!'
		expect(page).to have_content 'This is an example chit'
		end
end
