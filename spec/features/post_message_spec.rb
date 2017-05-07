
feature 'Post message' do
	scenario 'When logged in user can post text message ' do
		current_user = add_user
		sign_in('sam', '1234')
		click_link 'Chitter Home'
		fill_in 'message', with: 'Testing testing 123'
		expect { click_button 'Peep!' }.to change { current_user.messages.length }.by 1
		within 'div.peeps' do
			expect(page).to have_content 'Testing testing 123'
		end	
	end
end