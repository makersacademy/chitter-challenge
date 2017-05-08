def sign_up
   visit '/users/new'
   expect(page.status_code).to eq(200)
   fill_in :name, with: "Daniel Costea"
   fill_in :username, with: "d.costea"
   fill_in :email,    with: "daniel.costea@vkernel.ro"
   fill_in :password, with: "123456"
   click_button 'Sign up'
 end
