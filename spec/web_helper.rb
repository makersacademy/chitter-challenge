def register_user
  visit '/users/new'
  fill_in 'username', with: 'JoB123'
  fill_in 'name', with: 'Jo Bloggs'
  fill_in 'email', with: "jobloggs@test.com"
  fill_in 'password', with: "P455w0rd"
  click_button 'register'
end
