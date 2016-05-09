feature 'Sign in' do
  let!(:user) do
    User.create(name: 'Nick',
                user_name: 'nmrichards',
                email: 'batman@gmail.com',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'allows user to sign in' do
    sign_in
    expect(page).to have_content("Welcome Nick")
  end

  scenario 'does not authenticate when incorrect password/email combo' do
    visit "/"
    click_button 'Sign in'
    fill_in :user_name, with: 'nmrichards'
    fill_in :password, with: 'passwords'
    click_button 'Sign in'
    expect(current_path).to eq('/sessions')
    expect(page).to have_content('The username and/or password is incorrect')
  end
end
