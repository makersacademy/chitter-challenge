require 'spec_helper'

feature 'Sign up' do

  scenario 'can register new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('You are logged in as eric@example.com')
    expect(User.first.email).to eq('eric@example.com')
  end
  scenario 'mismatched confirmation password fails' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/signup')
    expect(page).to have_content 'Password and confirmation password do not match'
  end
  scenario 'cannot sign up without email address' do
   expect { sign_up(email: nil) }.not_to change(User, :count)
 end
end
