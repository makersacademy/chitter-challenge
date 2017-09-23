def default_peepline
  @peep1 = 'And those who are first will be last'
  @peep2 = 'So those who are last now will be first'
  peep_array = [@peep1, @peep2]
  peep_array.each do |peep_body|
    new_peep = Peep.create(body: peep_body)
    new_peep.save
  end
end

def sign_up(username: 'Hoss',
            real_name: 'Harry Blackstone Copperfield Dresden',
            email: 'HarryBCDresden@aol.com',
            password: 'hunter2')
  visit '/signup_to_peep'
  expect(page.status_code).to eq(200)
  expect(page).to have_content('Sign up to peep')
  fill_in :username, with: username
  fill_in :real_name, with: real_name
  fill_in :email_address, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password
  # fill_in :password_confirmation, with: password
  click_button 'Become a peeper!'
end

def sign_up_wrong_password(username: 'Hoss',
                           real_name: 'Harry Blackstone Copperfield Dresden',
                           email: 'HarryBCDresden@aol.com',
                           password: 'hunter2',
                           wrong_password: 'hunter3')
  visit '/signup_to_peep'
  fill_in :username, with: username
  fill_in :real_name, with: real_name
  fill_in :email_address, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: wrong_password
  # fill_in :password_confirmation, with: password
  click_button 'Become a peeper!'
end
