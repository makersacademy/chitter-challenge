# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
require_relative 'web_helpers'

feature "Sign up functionality" do

  let(:email)     { "rick@astley.com" }
  let(:username)  { "rickroll" }
  let(:password)  { "nggyu"}
  let(:name)      { "Rick Astley" }

  let(:sign_up_params)  {
    {
    name:     name,
    username: username,
    password: password,
    email:    email,
    }
  }

  scenario "User goes to sign up page and signs in" do

    user_count = User.count

    visit '/sign-up'
    fill_in_sign_up_form(sign_up_params)


    expect { click_button 'Sign Up' }.to change(User, :count).by(1)

  end

end
