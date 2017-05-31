require_relative '../web_helpers'

feature 'user sign up' do
  scenario 'user can regsister as a new user' do
    sign_up 
    expect { sign_up }.to change(User, :count).by 1
  end
end