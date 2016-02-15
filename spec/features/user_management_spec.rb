feature 'User Sign-up' do
	scenario 'visitors can sign up as Chitter users' do
		
		expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, cooluser_123')
    expect(User.first.username).to eq('cooluser_123')
  end
end