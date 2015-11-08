require "spec_helper.rb"
require "web_helpers.rb"

feature "sign up as new user" do

  scenario "welcome message for new user" do
    sign_up
    expect(page).to have_content "Welcome to Chitter Anderson_Silva_123"
  end

  scenario "sign up adds the user to the Chitter database" do
    sign_up
    expect(User.first.email).to eq('anderson_is_king@email.com')
  end

  scenario "I cannot sign up with an existing email address" do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('We already have that email')
  end

  scenario "I cannot sign up with an existing username" do
    sign_up
    expect { sign_up_2 }.to_not change(User, :count)
    expect(page).to have_content('We already have that username')
  end

end
