require 'spec_helper'
require 'web_helper'

feature 'User sign up' do
  scenario 'allows user to sign up' do
    sign_up
    expect(page).to have_content("Welcome @ChittTalker!")
   # expect(User.first_name).to eq("Testy")
   # expect(User.last_name).to eq("Testington")
  end
end

=begin
  
valid / matching passwords
valid email address
email address not already in use
  
=end