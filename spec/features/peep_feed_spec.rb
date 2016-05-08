feature 'Peep Feed' do
	
	scenario '- user not logged in can view all peeps in chronological order' do
		sign_up
		sign_in
		fill_in('content', with: 'This is my first test peep')
		click_button('Post')
		sleep 1
		fill_in('content', with: 'This is my second test peep')
		click_button('Post')
		click_button('Sign out')
		expect(page).to have_content(/This is my second test peep .+ This is my first test peep/)
	end

	scenario '- user can see when a peep was posted' do
		formatted = Time.now.strftime("%H:%M, %A %-d %b %Y")
		sign_up
		sign_in
		fill_in('content', with: 'This is my first test peep')
		click_button('Post')
		expect(page).to have_content(formatted)
	end

end