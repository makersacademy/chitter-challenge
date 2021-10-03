feature 'Create user' do
  scenario 'can display user sign up form' do
    visit('/users/new')
    expect(page).to have_field('user_name', type: 'username')
    expect(page).to have_field('email', type: 'email')
    expect(page).to have_field('password', type: 'password')
    expect(page).to have_button('submit')
  end
  scenario 'signs user in' do
    visit('/users/new')
    fill_in 'user_name', with: 'test'
    fill_in 'email', with: 'test@example.com'
    fill_in 'password', with: 'example'
    click_button('submit')
    expect(page).to have_content 'Welcome test, you are signed in.'
  end
end
