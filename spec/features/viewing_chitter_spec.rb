feature 'Viewing Chitter' do
	scenario 'Visint chitter for first time' do
		visit('/')
		expect(page).to have_content('Welcome to Chitter!')
	end

	scenario 'Seeing messages from others' do
		time = Time.now
		user = User.create(name: 'test', u_name: 'u_test12', email: 'test12@test.com', password: 'test1234')
		message = Message.create(text: 'testing', m_date: time.strftime("%Y-%m-%d"), user_id: user.id)
		visit('/')
		expect(page).to have_content('Welcome to Chitter!')
		expect(page).to have_content message.text
		expect(page).to have_content user.name
	end
end