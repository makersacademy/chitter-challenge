feature 'User Log In' do
  scenario 'can enter the website' do
    user_sign_up
    user_log_in(username: 'Deadpool', password: 'ihatewolverine92')
    expect(page).to have_content('Welcome Deadpool! Chit away!')
  end
end
