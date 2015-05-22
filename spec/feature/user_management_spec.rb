require 'capybara/rspec'

feature "Chitter user behaviour" do

  scenario "Users can sign up for Chitter" do
    visit '/'
    click_link "Sign Up"

    expect { sign_up }.to change(User, :count).by(1)
    expect(User.count).to eq(1)

    user = User.first
    expect(user.name).to eq("John Bosco")
    expect(user.username).to eq("Chitterer")
  end

  def sign_up name="John Bosco", username="Chitterer", email="first@chitterer.com", password="123"
    visit '/users/new'
    within('#sign-up-form') do
      fill_in "name", with: name
      fill_in "username", with: username
      fill_in "email", with: email
      fill_in "password", with: password
      click_button "Sign Up"
    end
  end

end