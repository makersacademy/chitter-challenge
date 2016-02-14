# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Iryna')
    expect(User.first.email).to eq('iryna@mail.com')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

end