# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature 'User management' do
  scenario 'As a new user, I want to be able to sign up to Chitter' do
    expect{ create_chitter_account }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Albert')
    expect(User.first.email_address).to eq('albert@gmail.com')
  end

  scenario 'requires a matching confirmation password' do
    expect { create_chitter_account(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password and confirmation password do not match'
  end
end
