feature 'sign up with credidentials that exist' do
  scenario 'error message displayed if duplicate email provided' do
    visit('/peeps')
    sign_up
    click_button('Sign out')
    click_link('Sign up')
    fill_in('email', with: 'yourname@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'John Doe')
    fill_in('username', with: 'test_name')
    click_button('Sign up')
    expect(page).to have_content('This email is already registered')
  end
  scenario 'error message displayed if duplicate username provided' do
    visit('/peeps')
    sign_up
    click_button('Sign out')
    click_link('Sign up')
    fill_in('email', with: 'your_name@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'John Doe')
    fill_in('username', with: 'jdoe1982')
    click_button('Sign up')
    expect(page).to have_content('This username already exists')
  end
end
