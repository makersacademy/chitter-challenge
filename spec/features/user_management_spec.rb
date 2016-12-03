require './spec/web_helper'

feature 'User signs up' do
  scenario 'A user can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, test!')
    expect(User.first.email).to eq('test@test.com')
  end

  scenario "the passwords need to match" do
    expect {sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end
end
