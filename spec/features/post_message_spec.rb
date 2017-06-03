feature 'post message' do
	scenario 'new message appears on page' do
		Message.create(text: 'Long time viewer, first time poster.')
		sign_up
		expect(page).to have_content 'Long time viewer, first time poster.'
	end
	scenario 'user can fill in message on page' do
		sign_up
		fill_in('message', with: 'So many bugs!')
		click_button('Submit')
		expect(page).to have_content 'So many bugs!'
	end
end
