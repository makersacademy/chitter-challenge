feature 'User signs out' do

  before(:each) do
    User.create(:email => 'test@test.com',
                :username => 'Test',
                :password => 'test',
                :password_confirmation => 'test')
  end

  scenario 'while being signed in' do
    sign_in('test@test.com', 'Test', 'test')
    click_button "Sign out"
    expect(page).not_to have_content("Hello, Test")
  end
end

def sign_in(email, username, password)
    visit('/sessions/new')
    fill_in 'email', :with => email
    fill_in 'username', :with => username
    fill_in 'password', :with => password
    click_button "Sign in"
end
