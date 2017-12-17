feature 'User can sign in' do

  let!(:user) do User.create(user_name: 'Nikolaos',
                user_email: 'nikolaos@example.com',
                password: 'test1234',
                password_confirmation: 'test1234')
  end

  scenario 'with correct credentials' do
    sign_in
    expect(page).to have_content "Welcome to Chitter, #{user.user_name}"
  end

  

end
