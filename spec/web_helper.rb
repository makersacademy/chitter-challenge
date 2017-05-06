def sign_up

visit '/users/new'
expect(page.status_code).to eq(200)
fill_in :email,    with: 'w_gant@yahoo.co.uk'
fill_in :password, with: 'password'
fill_in :username, with: 'w_gant'
fill_in :name,     with: 'Will'
click_button 'Sign up'

end
