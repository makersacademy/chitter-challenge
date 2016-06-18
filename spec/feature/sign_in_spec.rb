
feature 'user can sign in' do

  scenario 'on the homepage, user wants to sign-in from the homepage' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter! Please sign in')
  end

 let!(:user) do
    User.create(email: 'user@example.com',
      password: '12345',
      name: 'Bobby',
      username: 'B123')
  end

   scenario 'signs the user onto Chitter' do
    visit('/')
    sign_in
    expect(page).to have_content('Welcome #{user.email}')
  end

end

 def sign_in
    fill_in 'username', with: 'B123'
    fill_in 'password', with: '12345'
    click_button 'Sign in'
  end
