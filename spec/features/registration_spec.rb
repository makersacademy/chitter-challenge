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
    User.create(email: 'test@example.com', password: 'password123', name: 'Test Name', username: 'testuser1')

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
    User.create(email: 'test@example.com', password: 'password123', name: 'Test Name', username: 'testuser1')
    
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

  scenario 'new user form cannot have blank fields' do
    visit '/users/new'
    click_button('Sign Up')

    expect(page).not_to have_content "Welcome, (@)"
    expect(page).to have_content "Please check the required fields."
  end

  scenario 'a user can sign up from the peeps page' do
    visit '/peeps'
    click_button('Register')
    
    expect(current_path).to eq '/users/new'
  end
end
