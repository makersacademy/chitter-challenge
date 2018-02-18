feature 'sign in' do
  scenario 'A user cna sign in with existing log in details' do
    sign_up
    click_button 'Log out'
    click_button "Sign up"
    fill_in 'username', with: 'Steve'
    fill_in 'email', with: 'example3@test.com'
    fill_in 'password', with: '12345'
    click_button 'Sign up'

    click_button 'Log out'
    click_button 'Log in'
    fill_in 'email', with: 'example@test.com'
    fill_in 'password', with: '12345'
    click_button 'Log in'
    expect(page).to have_content 'Welcome to Chitter, Daniel!'
  end

  scenario 'user submits incorrect log in details' do
    sign_up
    click_button 'Log out'
    click_button 'Log in'
    fill_in 'email', with: '43@frv.com'
    fill_in 'password', with: '4fjkvfner'
    click_button 'Log in'
    expect(page).to have_content 'Incorrect log in details'
  end
end
