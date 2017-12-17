require_relative "../../app/app.rb"

feature "User can sign up from the main page" do
  scenario "Go to the sign up page" do
    visit('/')
    click_link "Sign Up"

    expect(current_path).to eq('/sign_up')
  end

  scenario 'Can create peeps after sign up'  do
    sign_up

    expect(current_path).to eq '/peeps'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Welcome vale')

  end

end

def sign_up
  visit('/sign_up')
  fill_in "email", with: "v.r@gmail.com"
  fill_in "password", with: "1234"
  fill_in "name", with: "valentina"
  fill_in "username", with: "vale"
  click_button "Submit"
end
