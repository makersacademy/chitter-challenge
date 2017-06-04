feature 'Login to Chitter' do
  scenario 'a user can log in with their username' do
    sign_up('@codey_mc_code_face')
    login('@codey_mc_code_face')
    expect(User.first(username: '@codey_mc_code_face')).not_to be_nil
    expect(page).to have_content('Welcome @codey_mc_code_face')
  end
end
