require 'pry'
feature 'User Sign Up' do

  scenario 'creates a user' do
    expect{ sign_up }.to change{User.count}.by(1)
  end

  scenario 'does not create a user when password is entered incorrectly' do
    expect{ sign_up_incorrect_password }.not_to change{User.count}
  end

  scenario 'does not redirect when password does not match' do
    expect{ sign_up_incorrect_password }.not_to change{User.count}
    expect(current_path).to eq('/signup')
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  scenario "I can't sign up without an email address" do
    expect { sign_up_without_email }.not_to change{User.count}
  end

  scenario 'does not create a user without a valid email address' do
    expect{ sign_up_invalid_email }.not_to change{User.count}
    expect(current_path).to eq('/signup')
  end
end