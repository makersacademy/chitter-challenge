def sign_up
   visit '/users/new'
   expect(page.status_code).to eq 200
   fill_in :name, with: 'Ed Balls'
   fill_in :user_name, with: 'edball5'
   fill_in :email, with: 'ed@balls.com'
   fill_in :password, with: 'edball5'
   fill_in :password_confirmation, with: 'edball5'
   click_button 'Sign up'
end
