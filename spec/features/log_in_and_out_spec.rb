require_relative 'web_helpers.rb'

feature "Log in" do
  before(:each) do
    visit('/')
    prepare_databases
  end
  scenario "User should be able to log in" do
    fill_in('login_username', with: 'Canary')
    fill_in('login_password', with: 'password')
    click_button('Log in')
    expect(page).to have_content("Welcome to chitter Canary")
  end
end


feature "Log out" do
  before(:each) do
    visit('/')
    prepare_databases
    fill_in('login_username', with: 'Canary')
    fill_in('login_password', with: 'password')
    click_button('Log in')
  end
  scenario "User should be able to log in" do
    click_link("Log out")
    expect(page).to have_content('Register a chitter account')
  end
end
