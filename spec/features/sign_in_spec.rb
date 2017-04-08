# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
require_relative 'web_helpers'

feature "Sign up functionality" do

  let(:email)     { "rick@gmail.com" }
  let(:username)  { "rickroll" }
  let(:password)  { "nggyu"}
  let(:name)      { "Rick Astley" }

  let(:sign_up_params)  {
    {
    name:     name,
    username: username,
    password: password,
    email:    email,
    password_confirmation: password,
    }
  }

  scenario "User goes to sign up page and signs in" do

    user_count = User.count

    fill_in_sign_up_form(sign_up_params)

    expect { click_button 'Sign Up' }.to change(User, :count).by(1)

  end

  scenario "User doesn't add name" do
    sign_up_params[:name] = nil
    fill_in_sign_up_form(sign_up_params)
    expect { click_button 'Sign Up' }.not_to change(User,:count)
    
  end

  scenario "Passwords don't match" do
    sign_up_params[:password_confirmation]="Wrong"
    fill_in_sign_up_form(sign_up_params)
    expect { click_button 'Sign Up' }.not_to change(User,:count)
  end

  scenario "User tries to input non-unique email" do
    fill_in_sign_up_form(sign_up_params)
    click_button 'Sign Up'
    sign_up_params[:username]="Different"
    fill_in_sign_up_form(sign_up_params)
    expect { click_button 'Sign Up' }.not_to change(User,:count)
  end

  scenario "User tries to input and invalid email" do
    sign_up_params[:email] = "Not an Email"
    fill_in_sign_up_form(sign_up_params)
    expect { click_button 'Sign Up' }.not_to change(User,:count)

  end

  scenario "User tries to input non-unique username" do
    fill_in_sign_up_form(sign_up_params)
    click_button 'Sign Up'
    sign_up_params[:email]="Different@gmail.com"
    fill_in_sign_up_form(sign_up_params)
    expect { click_button 'Sign Up' }.not_to change(User,:count)
  end
end
