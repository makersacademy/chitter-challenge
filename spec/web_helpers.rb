def sign_up(name: 'Solid Snake',
            username: 'snake',
            email: 'snake@mgs.com',
            password: 'mgs1',
            password_confirmation: 'mgs1'
            )
  visit 'users/new'
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button "Sign up"
end
