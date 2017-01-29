require 'capybara/rspec'
require 'spec_helper'
require 'web_helper'

feature "Sign Up" do

  scenario "When I go on Chitter I can sign up with my email and provide a password, name and user name" do
    expect { sign_up }.to change(User, :count).by(1)
    # expect(current_path).to eq('/home')
    expect(page).to have_content("Welcome, art_ful_gar_funk")
    expect(User.last.email).to eq('92jackhenderson@gmail.com')
  end

  scenario 'requires a matching password confirmation' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Passwords do not match!'
  end
end

# feature "Log In" do
#
#   let!(:user) do #what does this let! mean?
#     User.create(email: '92jackhenderson@gmail.com',
#                 password: 'secret1234',
#                 name: 'Jack Henderson',
#                 user_name: 'art_ful_gar_funk')
#   end
#
#   scenario 'with correct credentials' do
#     log_in(email: user.email, password: user.password)
#     expect(page).to have_content "Welcome to Chitter #{user.name}!"
#   end
#
#   def log_in(email:, password:)
#     visit '/sessions/new'
#     fill_in :email, with: email
#     fill_in :password, with: password
#     click_button 'Log In'
#   end

# end
