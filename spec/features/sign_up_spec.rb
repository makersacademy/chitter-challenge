require "spec_helper.rb"

feature "sign up as new user" do

  before(:each) do
    visit '/'
    click_button 'Sign up'
    fill_in :name, with: 'Anderson'
    fill_in :username, with: 'Anderson_Silva_123'
    fill_in :email, with: 'anderson_is_king@email.com'
    fill_in :password, with: 'MMAbjj'
    click_button 'Confirm sign up'
  end

  scenario "welcome message for new user" do
    expect(page).to have_content "Welcome to Bookmark Manager, Bob123"
  end
end
