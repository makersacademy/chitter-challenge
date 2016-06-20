feature 'Peep' do
	scenario 'a logged in user can post a peep' do
		sign_up
		click_link 'PEEP!'
		fill_in :peep, with: 'This is my first peep'
		click_button 'Submit'
		expect(page).to have_content 'Riya: This is my first peep'
	end
end