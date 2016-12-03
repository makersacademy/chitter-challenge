require './app/app.rb'

describe "Sing up" do
  scenario "Users can sign up for Chitter" do
    visit('/')
    click_button "Sign up"
    expect(page).to have_button("Submit")
  end

  scenario "Users can sign up for Chitter" do
    visit('/')
    click_button "Sign up"
    fill_in :name, with: "one of makers"
    fill_in :username, with: "cat"
    fill_in :email, with: "cat@email.com"
    fill_in :password, with: "secret"
    click_button "Submit"
    users = User.all
    expect(users.count).to eq 1
  end
end
