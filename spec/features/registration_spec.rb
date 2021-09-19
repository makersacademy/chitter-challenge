feature 'create account' do
    scenario 'a user can sign up' do
      visit '/'
      click_button('New Account')
      fill_in('email', with: 'test@example.com')
      fill_in('password', with: 'password123')
      fill_in('username', with: 'mctest face')
      fill_in('student_name', with: 'Gerald')
      click_button('Create Account')
  
      expect(page).to have_content "What's happening?"
    end
  end

  