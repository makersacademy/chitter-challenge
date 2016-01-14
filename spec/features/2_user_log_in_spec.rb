feature 'User Log In' do
  feature 'Registered user' do
    scenario 'can enter the website' do
      user_sign_up
      user_log_in(username: 'Deadpool', password: 'ihatewolverine92')
      expect(page).to have_content('Welcome Deadpool! Chit away!')
    end
  end

  feature 'Not registered user' do
    scenario 'cannot enter the website' do
      user_log_in(username: 'Magneto', password: 'ihateXavier46')
      expect(page).not_to have_content('Welcome Magneto! Chit away!')
      expect(page).to have_content('Incorrect username or password. 
        Check your details or please sign up.')
    end
  end
end
