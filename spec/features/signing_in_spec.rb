feature 'user can sign in' do
  
  let(:user) do
    User.create(email: 'user123@example.com',
		 name: 'John Smith',
		 user_name: 'JohnSmith',
		 password: '1234567',
		 password_confirmation: '1234567')
  end

  scenario 'with correct credentials' do
    sign_in(user_name: user.user_name, password: user.password)
    expect(page).to have_content "Welcome, #{user.user_name}"
  end
end



		
