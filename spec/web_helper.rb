def sign_up
  visit '/sign_up'
  expect(page.status_code).to eq(200)
  fill_in :user_name,     with: 'Homer'
  fill_in :email,    with: 'Homerj@gmail.com'
  fill_in :password, with: 'donuts'
  click_button 'Sign up'
end

def create_peep(content)
  visit '/new'
  fill_in 'post_text', with: content
  click_button 'Peep'
end
