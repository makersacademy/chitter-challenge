def sign_up
  fill_in :name, with: "Barbara"
  fill_in :username, with: 'barbara_s'
  fill_in :email, with: 'hello@mail.com'
  fill_in :password, with: '1234'
  click_button('Submit')
end
