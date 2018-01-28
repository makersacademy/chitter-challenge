feature 'User signup' do
  scenario 'I want to sign up for Chitter' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Name')
    expect(User.first.email).to eq('someone@emailaddress.com')
  end

  scenario 'Requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password and confirmation password do not match'
  end
end
