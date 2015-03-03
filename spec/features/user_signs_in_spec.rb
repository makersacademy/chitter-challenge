feature "User signs in" do

  before(:each) do
    User.create(:email => "test@test.com",
                :username => "Test",
                :password => "test",
                :password_confirmation => "test")
  end

  scenario "with the correct credentials" do
    visit '/'
    expect(page).not_to have_content("Hello, Test")
    sign_in('test@test.com', 'Test', 'test')
    expect(page).to have_content("Hello, Test")
  end

  scenario "with incorrect credentials" do
    visit '/'
    expect(page).not_to have_content("Hello, Test")
    sign_in('test@test.com', 'Test', 'wrong')
    expect(page).not_to have_content("Hello, Test")
  end

  def sign_in(email, username, password)
    visit '/sessions/new'
    fill_in 'email', :with => email
    fill_in 'username', :with => username
    fill_in 'password', :with => password
    click_button 'Sign in'
  end
end
