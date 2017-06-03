feature 'post message' do
	scenario 'user can fill in message on page' do
		sign_up
		fill_in('message', with: 'So many bugs!')
		click_button('Submit')
		expect(page).to have_content 'So many bugs!'
	end
end
