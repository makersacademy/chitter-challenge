feature 'chitter feed page' do
	
	

  scenario 'if not logged in, cannot create a peep' do
		visit '/chitter-feed'
		expect(page).not_to have_selector "input[type=submit][value='Post your peep']"
  end

  feature 'logged in user' do

	  scenario 'if user signed in, can create a peep' do
			sign_up
			expect(page).to have_selector "input[type=submit][value='Post your peep']"
  	end

  	scenario 'can create a peep which then appears on the chitter feed' do
			sign_up
			fill_in('post', with: 'This is my first post!' )
			click_button 'Post your peep'
			expect(page).to have_content('This is my first post!')
	  end

  end

end