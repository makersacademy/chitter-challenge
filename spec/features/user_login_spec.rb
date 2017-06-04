feature 'Login to Chitter' do
  scenario 'a user can log in with their username' do
    sign_up
    login
    expect(user.username).to eq('@codey_mc_code_face')
    expect(page).to have_content('Welcome, @codey_mc_code_face')
  end
end
