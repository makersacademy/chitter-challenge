feature 'Logging' do
  scenario 'a user can login with a right username ans password' do
    User.create(name: 'John', username: 'john', email: 'john@example.com', password: 'password123')
    visit '/sessions/new'
    fill_in('username', with: 'john')
    fill_in('password', with: 'password123')
    click_button('Login')

    expect(page).to have_content "Welcome, John"
    expect(page).to have_content "You are logged in with this email: john@example.com"
  end

  scenario 'a user can\'t login with a wrong username' do
    User.create(name: 'John', username: 'john', email: 'john@example.com', password: 'password123')
    visit '/sessions/new'
    fill_in('username', with: 'wrongjohn')
    fill_in('password', with: 'password123')
    click_button('Login')

    expect(page).not_to have_content "Welcome, John"
    expect(page).not_to have_content "You are logged in with this email: john@example.com"
    expect(page).to have_content "Please check your email or password."
  end

  scenario 'a user can\'t login with a wrong password' do
    User.create(name: 'John', username: 'john', email: 'john@example.com', password: 'password123')
    visit '/sessions/new'
    fill_in('username', with: 'john')
    fill_in('password', with: 'wrongpassword')
    click_button('Login')

    expect(page).not_to have_content "Welcome, John"
    expect(page).not_to have_content "You are logged in with this email: john@example.com"
    expect(page).to have_content "Please check your email or password."
  end
end
