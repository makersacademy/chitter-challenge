feature 'Signing in to your account' do
  scenario 'displays sign in page' do
    visit '/chitter'
    click_on 'Sign in'
    expect(page).to have_content('Username')
  end

  scenario 'logs into existing account' do
    create_user
    visit '/chitter'
    click_on 'Sign in'
    fill_in 'username', with: 'Yoncé'
    fill_in 'password', with: 'lemonade'
    expect(page).to have_content('Welcome Beyonce Knowles')
  end
end
