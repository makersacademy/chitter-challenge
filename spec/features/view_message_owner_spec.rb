feature 'view message owner' do
	scenario 'every message shows which user it\'s posted by' do
		sign_up
		fill_in('message', with: 'Just read the metamorphisis')
		click_button 'Add Creet'
		time = Time.now.strftime('%H:%M:%S')
		expect(page).to have_content "SuperSteve4Prez posted at #{time}:" 
	end
end
