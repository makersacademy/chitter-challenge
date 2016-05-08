feature 'Filtering Peeps' do

	scenario '- logged in user can see just their own peeps by clicking my peeps only' do
		sign_up(email: 'user2@email.com', username: 'user2name')
		sign_in(email: 'user2@email.com')
		fill_in('content', with: 'User 2 peep')
		click_button('Post')
		click_button('Sign out')
		sign_up
		sign_in
		fill_in('content', with: 'User 1 peep')
		click_button('Post')
		click_button('My peeps only')
		expect(page).to have_content('User 1 peep')
		expect(page).not_to have_content('User 2 peep')
	end

end


