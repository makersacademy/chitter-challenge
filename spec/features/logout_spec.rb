require_relative 'helpers/session'

feature 'User log\'s out' do

  include SessionHelpers

  before(:each) do
    User.create(:name => 'tester',
                :username => 'username_test',
                :email => "test@test.com",
                :password => 'test',
                :password_confirmation => 'test')
  end

  scenario 'log\'s out after properly logging in' do
    sign_in('test@test.com', 'test')
    click_button "Sign out"
    expect(page).to have_content("Good bye!") 
    expect(page).not_to have_content("Welcome, username_test")
  end

end