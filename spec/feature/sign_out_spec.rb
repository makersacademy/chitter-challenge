feature 'User signs out' do

   before(:each) do
    User.create(email: 'test@test.com',
                name: 'Testy McTest',
                user_name: 'Test1',
                password: '123456',
                password_confirmation: '123456')
   end

    scenario 'while being signed in' do
      sign_in(email: 'test@test.com', password: '123456')
      visit '/peep'
      click_button 'Sign out'
      expect(page).to have_content('Goodbye')
    end
end
