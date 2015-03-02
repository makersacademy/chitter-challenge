feature 'User signs out' do

  before(:each) do
    User.create(:email => 'test@test.com',
                :password => 'test',
                :password_confirmation => 'test')
  end

  scenario 'while being signed in' do
    sign_in('test@test.com', 'test')
    click_button "Sign out"
    expect(page).not_to have_content("Welcome, test@test.com")
  end
end

def sign_in(email, password)
    visit('/sessions/new')
    fill_in 'email', :with => email
    fill_in 'password', :with => password
    click_button "Sign in"
end
