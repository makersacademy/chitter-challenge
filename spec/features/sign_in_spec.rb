feature 'User sign in' do

  let!(:user) do
    User.create(username: 'bob123',
								email: 'bob@bob.com',
								name: 'Bob',
		            password: '12345678',
		            password_confirmation: '12345678')
  end

  scenario 'with correct credentials' do
    sign_in(username: user.username,   password: user.password)
    expect(page).to have_content "Welcome, #{user.name}"
  end

  def sign_in(username:, password:)
    visit '/'
		within('form#SignIn') do
    	fill_in :username, with: username
    	fill_in :password, with: password
    	click_button 'Sign in'
		end
  end


	scenario 'with incorrect credentials' do
  expect(User.authenticate(user.username, 'wrongpassword')).to be_nil
end

end
