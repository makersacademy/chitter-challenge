feature 'makers can log in to chitter' do
  scenario 'a maker successfully logs in' do
    sign_up
    click_button 'Log out'
    click_button 'Log in'
    fill_in 'username', with: 'Squirrel'
    fill_in 'password', with: '1234'
    click_button 'Log in'
    expect(page).to have_content 'Hello Squirrel!'
  end

  scenario 'a maker tries logging in with an invalid username' do
    sign_up
    click_button 'Log out'
    click_button 'Log in'
    fill_in 'username', with: 'Fox'
    fill_in 'password', with: '1234'
    click_button 'Log in'
    expect(page).to have_content 'Your login details were invalid, please try again'
  end

  scenario 'a maker tries logging in with an invalid password' do
    sign_up
    click_button 'Log out'
    click_button 'Log in'
    fill_in 'username', with: 'Squirrel'
    fill_in 'password', with: '2345'
    click_button 'Log in'
    expect(page).to have_content 'Your login details were invalid, please try again'
  end
end
