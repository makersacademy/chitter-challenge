def sign_up
visit '/'
fill_in 'name', with: 'Ahmed'
fill_in 'user_name', with: 'hyper0009'
fill_in 'email', with: 'smokey@yahoo.com'
end
