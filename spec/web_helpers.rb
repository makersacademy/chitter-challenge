def sign_up(email: 'ryan@aol.com', username: 'username', password: 'password', password_confirmation: 'password')
  visit('/users/new')
  expect(page.status_code).to eq 200
  fill_in 'email', with: email
  fill_in 'username', with: username
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'Log in'
end

def log_in

end

def post_peep(peep_content: 'content', tags: 'tags')
  visit('/peeps/new')
  expect(page.status_code).to eq 200
  fill_in 'peep_content', with: peep_content
  fill_in 'tags', with: tags
  click_button 'Post'
end
