def sign_in
Maker.create(username: 'sallywag', email: 'sally@dogs.com', password: 'sally1')
visit '/sessions/sign_in'
fill_in 'username', with: 'sallywag'
fill_in 'password', with: 'sally1'
click_button 'sign in'
end
