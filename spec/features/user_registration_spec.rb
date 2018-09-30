feature 'registration' do
  scenario 'a user can sign up' do
    sign_up_and_go_to_homepage
    expect(page).to have_content "Hi Test, welcome to Chitter!"
  end

  scenario 'a user can only sign up with a unique username' do
    sign_up_and_go_to_homepage
    click_button('Log Out')
    click_link 'Sign Up'
    fill_in('name', with: 'Test Name')
    fill_in('username', with: 'Test')
    fill_in('email', with: 'test2@example.com')
    fill_in('password', with: 'password1234')
    click_button('Submit')

    expect(page).not_to have_content "Hi Test, welcome to Chitter!"
    expect(page).to have_content "That username or email is already in use, please choose another one"
  end

  scenario 'a user can only sign up with a unique username' do
    sign_up_and_go_to_homepage
    click_button('Log Out')
    click_link 'Sign Up'
    fill_in('name', with: 'Test Name')
    fill_in('username', with: 'Test2')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password1234')
    click_button('Submit')

    expect(page).not_to have_content "Hi Test2, welcome to Chitter!"
    expect(page).to have_content "That username or email is already in use, please choose another one"
  end

end
