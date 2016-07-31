# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'sign up' do

  scenario 'user signs up for chitter' do
    visit 'users/new'
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content 'Hello there, grmillsy'
    expect(User.first.email).to eq 'g@hotmail.com'
  end

  scenario 'passwords dont match' do
    expect {sign_up(password_confirmation: 'wrong') }.to_not change(User, :count)
    expect(page).to have_content "Password does not match"
  end

  scenario 'User enters a blank email' do
    expect { sign_up(email: nil) }.to_not change(User, :count)
  end

  scenario 'User enters the same email address' do
    sign_up
    expect{sign_up}.to_not change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end

  scenario 'User enters the same username' do
    sign_up
    expect{sign_up}.to_not change(User, :count)
    expect(page).to have_content 'Username is already taken'
  end
end
