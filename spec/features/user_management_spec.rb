feature 'User management' do

  scenario 'User can sign up' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome to Chitter, jinis!')
    expect(User.first.user_name).to eq('jinis')
  end

  scenario 'User needs to confirm password before signing up' do
    expect{sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password did not match...')
  end

  # scenario 'User can\'t sign up if email already exist' do
  #   sign_up
  #   expect{ sign_up }.not_to change(User, :count)
  #   expect(current_path).to eq('/users')
  #   expect(page).to have_content('This email address has already been used...')
  # end
end
