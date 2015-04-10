require 'capybara/rspec'

feature 'User signs out' do
  scenario 'Can find and click log out button when user is logged in' do
    sign_up
    expect(current_path).to eq('/')
    expect(page).to have_content('Welcome, ' + User.first.email)
    find_button('Log Out').click
  end

  scenario 'user is logged out after clicking log out button' do
    sign_up
    find_button('Log Out').click
    expect(current_path).to eq('/welcome/')
  end

  xscenario 'there is no log out button when no one is logged in'
end
