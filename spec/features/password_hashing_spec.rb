feature 'Password protection' do
	scenario 'A user should have their password hashed before storage' do
		expect(BCrypt::Password).to receive(:create).with('password123')
		visit('/sign_in')
		fill_in('first_name', with: 'Testy')
		fill_in('last_name', with: 'McTest')
		fill_in('username', with: 'Testusername')
		fill_in('email', with: 'testing@msn.com')
		fill_in('password', with: 'password123')
		click_on('Submit')
	end
end