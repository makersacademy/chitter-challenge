feature "View user's messages" do
	scenario 'When logged in user can see messages they posted previously' do
		add_user
		sign_in('sam', '1234')
		post_message "Testing testing 123" 
		visit '/account'
		within 'div.peeps' do
			expect(page).to have_content 'Testing testing 123'
		end	
	end
end