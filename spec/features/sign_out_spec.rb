
feature 'User signs out' do

  let!(:user) do
    User.create(email: 'dog@says.com',
                password: 'bau',
                password_confirmation: 'bau')
  end

  scenario 'while being signed in' do
     sign_in(email: 'dog@says.com', password: 'bau')
     click_button 'Sign out'
     expect(page).to have_content('goodbye!')
     expect(page).not_to have_content('Welcome, dog@says.com')
   end


end
