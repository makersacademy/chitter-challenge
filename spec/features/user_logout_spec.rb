feature 'Logout of Chitter' do
  scenario 'a user can log out with their username' do
    sign_up('@codey_mc_code_face')
    login('@codey_mc_code_face')
    logout('@codey_mc_code_face')
    expect(page).to have_content('Welcome')
  end
end
