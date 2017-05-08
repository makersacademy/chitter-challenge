feature "View user's messages" do
	scenario 'Visitor can see all messages on homepage' do
		add_user
		sign_in('sam', '1234')
		post_message 'Testing testing 123'
		within 'div.peeps' do
			expect(page).to have_content 'Testing testing 123'
		end	
	end
	scenario 'Messages on homepage are displayed newest first' do
		add_user
		sign_in('sam', '1234')
		post_message 'Older'
		sleep(1)
		post_message 'Latest'
		page.should have_selector("div.peeps article:nth-of-type(1)", text: 'Latest')
		page.should have_selector("div.peeps article:nth-of-type(2)", text: 'Older')
	end
end