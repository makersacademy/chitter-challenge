def sign_up
  visit '/sign_up'
  fill_in 'e_mail', with: 'nst@mail.com'
  fill_in 'name', with: 'Natalia'
  fill_in 'username', with: 'Nat-Nat'
  fill_in 'password', with: '123456'
  click_button 'Sign up'
end

def sign_in
  User.create(name: 'Natalia', username: 'Nat-Nat',
              e_mail: 'n@mail.com', password: '123456')
  visit '/sign_in'
  fill_in 'username', with: "Nat-Nat"
  fill_in 'password', with: "123456"
  click_button 'Sign in'
end
