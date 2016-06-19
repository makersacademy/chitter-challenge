require './spec/web_helper'

feature 'Signing up' do
  scenario 'user signs up' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome marlon')
    expect(User.first.username).to eq('marlon')
  end

  scenario 'password and confirmation do not match' do
    expect{ sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password and confirmation do not match')
  end
end
