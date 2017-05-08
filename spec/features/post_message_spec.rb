
feature 'Post message' do
	scenario 'When logged in user can post text message ' do
		add_user
		sign_in('sam', '1234')
		post_message 'Testing testing 123'
		within 'div.peeps' do
			expect(page).to have_content 'Testing testing 123'
		end	
	end
end