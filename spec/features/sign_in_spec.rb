require 'pg'

feature "Sign in" do

  scenario "it asks the user to enter username and password" do
    log_in
    expect(page).to have_content "Hi claude"
  end

  scenario "it allows users to sign up" do
    sign_up
    expect(page).to have_content "Hi claude"
  end

end
