feature 'User management' do
  scenario 'User can sign up with name, username, email, password' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome to Chitter, ghost!')
    expect(User.first.username).to eq('ghost')
  end

  scenario 'mismatch of passwords' do
    expect{sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password did not match...')
  end
end
