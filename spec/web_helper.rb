

  def sign_in(email: 'test@test.com',
              password: '123456')
      visit '/session/new'
      fill_in :email, with: email
      fill_in :password, with: password
      click_button 'Sign in'
  end

  def sign_up(email: 'test@test.com',
              name: 'Testy McTest',
              user_name: 'Test1',
              password: '123456',
              password_confirmation: '123456')
      visit '/users/new'
      expect(page.status_code).to eq(200)
      fill_in :email,                 with: email
      fill_in :name,                  with: name
      fill_in :user_name,             with: user_name
      fill_in :password,              with: password
      fill_in :password_confirmation,  with: password_confirmation
      click_button 'Sign up'
      end
