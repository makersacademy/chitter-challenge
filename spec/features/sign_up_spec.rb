require_relative 'web_helpers'

feature "sign up" do

  scenario "user can sign up" do
    fill_sign_in_form
    expect{ click_button "Sign up" }.to change(User, :count).by(1)
    expect(page).to have_content "Hello Jon Doe"
  end
  scenario "user can't sign up if he enters password incorrectly" do
    fill_sign_in_form
    fill_in "password_confirmation", with: "wrongpassword"
    expect{ click_button "Sign up" }.not_to change(User, :count)
  end
end
