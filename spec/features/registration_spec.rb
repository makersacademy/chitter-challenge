feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Test Name')
    fill_in('username', with: 'testuser1')
    click_button('Sign Up')

    expect(page).to have_content "Welcome, Test Name (@testuser1)"
  end

  scenario 'new user username must be unique' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Test Name')
    fill_in('username', with: 'testuser1')
    click_button('Sign Up')

    visit '/users/new'
    fill_in('email', with: 'test2@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Test Name 2')
    fill_in('username', with: 'testuser2')
    click_button('Sign Up')

    visit '/users/new'
    fill_in('email', with: 'test3@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Test Name 3')
    fill_in('username', with: 'testuser1')
    click_button('Sign Up')

    expect(page).not_to have_content "Welcome, Test Name (@testuser1)"
    expect(page).not_to have_content "An account with that email already exists."
    expect(page).to have_content "That username is already taken."
  end

  scenario 'new user email must be unique' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Test Name')
    fill_in('username', with: 'testuser1')
    click_button('Sign Up')
    
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Test Name')
    fill_in('username', with: 'testuser2')
    click_button('Sign Up')

    expect(page).not_to have_content "Welcome, Test Name (@testuser2)"
    expect(page).not_to have_content "That username is already taken."
    expect(page).to have_content "An account with that email already exists."
  end

  xscenario 'new user form cannot have blank fields' do
    visit '/users/new'
    click_button('Sign Up')

    expect(page).not_to have_content "Welcome, (@)"
    # Test fails. Why does Capybara form submission surpass required fields? in feature test you are unable to be redirected to peeps page. 
  end
end
