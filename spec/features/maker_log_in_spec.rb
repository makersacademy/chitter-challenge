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
end
