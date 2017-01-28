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

  scenario 'User cannot sign up without valid email address' do
    expect{ faulty_email_sign_up }.not_to change{User.count}
  end

  scenario 'User cannot sign up without completing all fields' do
    expect{ empty_sign_up }.not_to change{User.count}
  end

  scenario 'User cannot sign up with the same email multiple times' do
    sign_up
    expect{ sign_up_dup_email }.not_to change{User.count}
  end

  scenario 'User must have a unique username' do
    sign_up
    expect{ sign_up_dup_username }.not_to change{User.count}
  end

end
