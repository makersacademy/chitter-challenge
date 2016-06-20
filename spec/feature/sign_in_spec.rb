
feature 'user can sign in' do

  scenario 'on the homepage, user wants to sign-in from the homepage' do
    visit('/sessions/new')
    expect(page).to have_content('Welcome to Chitter! Please sign in')
  end

 let!(:user) do
    User.create(email: 'user@example.com',
      password: '12345',
      name: 'Bobby',
      username: 'B123')
  end

   scenario 'signs the user with correct credentials onto Chitter' do
    visit('/sessions/new')
    sign_in(username: user.username, password: user.password)
    expect(page).to have_content("Welcome to Chitter, #{ @current_user }")
  end

end

 def sign_in(username:, password:)
    fill_in 'username', with: username
    fill_in 'password', with: password
    click_button 'Sign in'
end


