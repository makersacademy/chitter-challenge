def sign_up
   visit '/users/new'
   expect(page.status_code).to eq(200)
   fill_in :name, with: "John Smith"
   fill_in :username, with: "j.smith"
   fill_in :email,    with: "john@example.com"
   fill_in :password, with: "123456"
   click_button 'Sign up'
 end
