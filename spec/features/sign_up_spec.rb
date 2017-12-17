require_relative "../../app/app.rb"


feature "User can sign up from the main page" do
  scenario "Go to the sign up page" do
    visit('/')
    click_link "Sign Up"

    expect(current_path).to eq('/sign_up')
  end

  scenario "User fills form with personal info and submits" do
    visit('/sign_up')
    fill_in "email", with: "v.r@gmail.com"
    fill_in "password", with: "1234"
    fill_in "name", with: "valentina"
    fill_in "username", with: "vale"
    click_button "Submit"

    expect(current_path).to eq('/peeps')

  end



end
