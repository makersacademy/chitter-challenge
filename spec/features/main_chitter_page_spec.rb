feature 'main Chitter page' do
  scenario 'be welcomed on the main page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end

  scenario 'have a Chitter Feed link' do
    visit('/')
    expect(page).to have_button "Open Public Feed"
  end

  scenario 'have a log in option' do
    visit ('/')
    expect(page).to have_button "Login"
    expect(page).to have_field "username"
    expect(page).to have_field "password"
  end

  scenario 'have a create account option' do
    visit('/')
    expect(page).to have_button "Create Account"
  end
end
