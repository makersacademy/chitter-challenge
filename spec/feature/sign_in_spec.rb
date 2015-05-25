require 'capybara/rspec'

feature "Session management" do
  before(:each) do
    User.create(name: "Chidu", username: "Swagchief", email: "chidu@chidu.com", password: "12345")
  end

  scenario "Registered users can sign into Chitter" do
    visit '/'
    click_link 'Sign In'

    expect(page).not_to have_content("Welcome Chidu")
    sign_in("chidu@chidu.com", "12345")
    expect(page).to have_content("Welcome Swagchief")
  end

  def sign_in email, password
    visit '/sessions/new'
    within('#sign-in-form') do
      fill_in "email", with: email
      fill_in "password", with: password
      click_button "Sign In"
    end
  end
end