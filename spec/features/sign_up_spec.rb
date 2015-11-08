require "spec_helper.rb"
require "web_helpers.rb"

feature "sign up as new user" do

  # before(:each) do
  #   visit '/'
  #   click_button 'Sign up'
  #   fill_in :name, with: 'Anderson'
  #   fill_in :username, with: 'Anderson_Silva_123'
  #   fill_in :email, with: 'anderson_is_king@email.com'
  #   fill_in :password, with: 'MMAbjj'
  #   click_button 'Confirm sign up'
  # end

  scenario "welcome message for new user" do
    sign_up
    expect(page).to have_content "Welcome to Bookmark Manager, Anderson_Silva_123"
  end

  scenario "sign up adds the user to the Chitter database" do
    sign_up
    expect(User.first.email).to eq('anderson_is_king@email.com')
  end
end
