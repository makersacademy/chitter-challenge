def register_new_user
visit '/users/new'
fill_in 'email', with: 'freddy@well.com'
fill_in 'password', with: 'password123'
click_on 'Register'
end
