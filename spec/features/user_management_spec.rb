require './spec/web_helper'

feature 'User signs up' do
  scenario 'A user can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, test!')
    expect(User.first.email).to eq('test@test.com')
  end

  scenario "the passwords need to match" do
    expect {sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  scenario "the user must have an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario "the user must use a valid email address" do
    expect {sign_up(email: 'dan@dan') }.not_to change(User, :count)
  end

end
