require_relative 'web_helpers'

feature "logging in" do
  scenario "A signed up user logs in correctly and is sent to the peeps page" do
    sign_up_to_sign_in
    visit '/sessions/login'
    fill_in :email, with: "123@me.com"
    fill_in :user_password, with: "12345678"
    click_button "Get Chitting"

    expect(page).to have_current_path '/peeps'
    expect(page).to have_content "Signed in as Eddie"
  end
end
