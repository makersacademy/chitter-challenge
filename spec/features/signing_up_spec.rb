require './app/app.rb'

describe "Sing up" do
  scenario "Users can sign up for Chitter" do
    visit('/')
    click_button "Sign up"
    expect(page).to have_button("Submit")
  end

end
