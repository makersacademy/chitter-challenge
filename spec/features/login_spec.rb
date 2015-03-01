require_relative 'helpers/session'

feature "User log's in" do

  include SessionHelpers

  before(:each) do
    User.create(:name => 'tester',
                :username => 'username_test',
                :email => "test@test.com",
                :password => 'test',
                :password_confirmation => 'test')
  end

  scenario "user log's in with correct credentials" do
    visit '/'
    expect(page).not_to have_content("Welcome, username_test")
    sign_in('test@test.com', 'test')
    expect(page).to have_content("Welcome, username_test")
  end

end