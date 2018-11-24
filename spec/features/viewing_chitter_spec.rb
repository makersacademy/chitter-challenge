feature 'Viewing Chitter' do
	scenario 'Visint chitter for first time' do
		visit('/')
		expect(page).to have_content('Welcome to Chitter!')
	end
end