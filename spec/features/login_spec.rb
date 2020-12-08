require 'capybara/rspec'

feature "Log In" do
  scenario "allows a log in with valid username and password" do
    partario = User.create(username: "partario", email: "test@email.com", password: "1234")
    visit('/')
    fill_in('username', with: 'partario')
    fill_in('password', with: '1234')
    click_button('Go online')
    expect(current_path).to eq('/app')
    expect(page).to have_content(/partario/)
  end

  scenario "returns to login page with invalid details" do
    visit('/')
    fill_in('username', with: 'partario')
    fill_in('password', with: '1234')
    click_button('Go online')
    expect(current_path).to eq('/')
    expect(page).to have_content(/invalid/)
  end

  scenario "user can log out" do
    partario = User.create(username: "partario", email: "test@email.com", password: "1234")
    visit('/')
    fill_in('username', with: 'partario')
    fill_in('password', with: '1234')
    click_button('Go online')
    click_button('Log Off')
    expect(page).to have_content(/logged off/)
    expect(current_path).to eq('/')
  end
end
