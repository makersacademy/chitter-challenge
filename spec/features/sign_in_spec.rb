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
    click_button 'Sign in'
    expect(page).to have_content('Welcome Yoncé')
  end

  scenario 'Error on sign in if user does not exist' do
    visit '/chitter'
    click_on 'Sign in'
    fill_in 'username', with: 'Yoncé'
    fill_in 'password', with: 'lemonade'
    click_button 'Sign in'
    expect(page).to have_content("This user doesn't exist")
  end

  scenario 'Error on sign in if password is wrong' do
    create_user
    visit '/chitter'
    click_on 'Sign in'
    fill_in 'username', with: 'Yoncé'
    fill_in 'password', with: 'water'
    click_button 'Sign in'
    expect(page).to have_content("Wrong password")
  end
end
