feature 'Registration' do
  scenario 'a user can register' do
    visit '/users/new'
    fill_in('name', with: 'John')
    fill_in('username', with: 'john')
    fill_in('email', with: 'john@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content "Welcome, John"
    expect(page).to have_content "You are logged in with this email: john@example.com"
  end

  scenario 'a user see an error if the username is already registered' do
    User.create(name: 'John', username: 'john', email: 'john@example.com', password: 'password123')
    visit '/users/new'
    fill_in('name', with: 'John')
    fill_in('username', with: 'john')
    fill_in('email', with: 'johhny@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).not_to have_content "Welcome, John"
    expect(page).not_to have_content "You are logged in with this email: johhny@example.com"
    expect(page).to have_content "Username already in use!"
  end

  scenario 'a user see an error if the email is already registered' do
    User.create(name: 'John', username: 'john', email: 'john@example.com', password: 'password123')
    visit '/users/new'
    fill_in('name', with: 'John')
    fill_in('username', with: 'johny')
    fill_in('email', with: 'john@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).not_to have_content "Welcome, John"
    expect(page).not_to have_content "You are logged in with this email: john@example.com"
    expect(page).to have_content "Email already in use!"
  end
end
