def sign_up(user_name: 'Homer', email: 'homerj@gmail.com', password: 'donuts', password_confirmation: 'donuts')
  visit '/sign_up'
  expect(page.status_code).to eq(200)
  fill_in :user_name,     with: user_name
  fill_in :email,    with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

def create_peep(content)
  visit '/new'
  fill_in 'post_text', with: content
  click_button 'Peep'
end
