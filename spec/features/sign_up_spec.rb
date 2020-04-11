feature 'you can sign up to chitter' do
  scenario 'I should be notified when I have successfully signed up' do
    visit '/users/new'
    fill_in 'name', with: 'Phil'
    fill_in 'username', with: 'Squirrel'
    fill_in 'email', with: 'here@there.com'
    fill_in 'password', with: '1234'
    click_button 'Submit'
    expect(page).to have_content 'Hello Squirrel!'
  end

  scenario 'I should be notified when my username is already taken' do
    sign_up
    visit '/users/new'
    fill_in 'name', with: 'Phil'
    fill_in 'username', with: 'Squirrel'
    fill_in 'email', with: 'somewhere@there.com'
    fill_in 'password', with: '1234'
    click_button 'Submit'
    expect(page).to have_content 'Your username or email are already in use. Please try again'
  end

  scenario 'I should be notified when my email is already taken' do
    sign_up
    visit '/users/new'
    fill_in 'name', with: 'Phil'
    fill_in 'username', with: 'Fox'
    fill_in 'email', with: 'here@there.com'
    fill_in 'password', with: '1234'
    click_button 'Submit'
    expect(page).to have_content 'Your username or email are already in use. Please try again'
  end
end
