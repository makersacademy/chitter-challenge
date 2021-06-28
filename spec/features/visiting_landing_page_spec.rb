feature 'visiting landing page' do
	scenario 'A user can visit the landing page and view content' do
		visit('/')

		expect(page).to have_content('We care about peeps more than anything!')
	end
end
