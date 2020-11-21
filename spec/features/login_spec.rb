require 'capybara/rspec'

feature "Log In" do
  scenario "allows a log in with valid username and password" do
    visit('/')
    fill_in('username', with: 'partario')
    fill_in('password', with: '1234')
    click_button('login')
    expect(current_path).to eq('/app')
    expect(page).to have_content(/partario/)
  end
end