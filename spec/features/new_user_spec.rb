feature 'New user:' do
	scenario 'Non logged in users should be redirected to signup' do
		visit('/')
		click_on('Post a Peep')
		expect(current_path).to eq('/sign_in')
	end
end