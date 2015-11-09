require 'web_helper'

feature 'sign in' do
  scenario 'new user signs in' do
    expect{ join }.to change(User, :count).by(1)
    join
    expect(page.status_code).to eq(200)
    expect(User.first.username).to eq("Gio")
  end

  scenario 'password and confirmation password are different' do
    join(confirm_password: '234')
    expect(current_path).to eq('/authentication')
    expect{ join(confirm_password: '234') }.not_to change(User, :count)
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'cant join in without a username' do
    expect{ join(name: nil) }.not_to change(User, :count)
  end

  scenario 'Username is already taken' do
    join
    expect{ join }.not_to change(User, :count)
    expect(page).to have_content('Username is already taken')
  end
end
