feature 'post message' do
	scenario 'submit a message on page' do
		# fill_in('message', with: 'Long time viewer, first time poster.')
		Message.create(text: 'Long time viewer, first time poster.')
		visit '/'
		within 'ul#messages' do
			expect(page).to have_content 'Long time viewer, first time poster.'
		end
	end
end
