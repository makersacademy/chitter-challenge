require 'capybara/rspec'
require_relative '../../app'
Capybara.app = Chitter

feature "Homepage" do

  scenario "Expect the homepage form to load" do
    visit '/'
    expect(page).to have_content "Welcome"
  end

  scenario "Expect the homepage buttons to work" do
    visit '/'
    click_button('View Chitts')
    expect(page).to have_content "Here are the past chitts:"
    visit '/'
    click_button('Log In')
    expect(page).to have_content "Please log in below"
    visit '/'
    click_button('Post Chitt')
    expect(page).to have_content "Please post your chitt below:"
    visit '/'
    click_button('Log Out')
    expect(page).to have_content "You've successfully logged out!"
  end

  scenario 'If you go to chitter accidentally, it takes you to the homepage' do
    visit '/chitter'
    expect(page).to have_content "Welcome"
  end
end
