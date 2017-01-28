require 'spec_helper'

#USER STORY 1
#As a Maker
#So that I can post messages on Chitter as me
#I want to sign up for Chitter

feature 'Signing up' do
  scenario 'A user can sign up for chitter' do
    sign_up
    expect(page).to have_content('Please log in')
end

  scenario 'Increase user count by 1 when signing up' do
    expect{ sign_up }.to change{User.count}.by(1)
  end

end
