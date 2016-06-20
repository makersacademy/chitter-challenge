feature 'Peep' do
	scenario 'a user that is signed in can  peep' do
		sign_up
		click_link 'PEEP!'
		fill_in :peep, with: 'This is my first peep!'
		click_button 'Submit'
		expect(page).to have_content 'Faisal: This is my first peep!'
	end
end