require 'spec_helper'

feature "User views the peeps" do

  before(:each) do
    User.create(:email => 'test@test.com',
                :username => 'Test',
                :password => 'test',
                :password_confirmation => 'test')
  end

  scenario "when opening the homepage" do
    sign_in('test@test.com', 'Test', 'test')
    post_peep('Hello Chitter')
    expect(page).to have_content("Hello Chitter")
  end
end

def sign_in(email, username, password)
    visit('/sessions/new')
    fill_in 'email', :with => email
    fill_in 'username', :with => username
    fill_in 'password', :with => password
    click_button "Sign in"
end

def post_peep(text)
    visit('/')
    fill_in 'text', :with => text
    click_button "post"
end
