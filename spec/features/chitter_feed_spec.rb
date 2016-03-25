feature 'chitter feed page' do
	
	scenario 'if user signed in, can create a peep' do
		sign_up
		expect(page).to have_selector "input[type=submit][value='Create Peep']"
  end

  scenario 'if not logged in, cannot create a peep' do
		visit '/chitter-feed'
		expect(page).not_to have_selector "input[type=submit][value='Create Peep']"
  end

end