feature 'User can sign in' do

  let!(:user) do User.create(user_name: 'test_user',
                user_email: 'test_user@tests.test',
                password: 'testing123',
                password_confirmation: 'testing123')
  end

  scenario 'with correct credentials' do
    sign_in
    expect(page).to have_content "Welcome to Chitter, #{user.user_name}"
  end

end
