def user_sign_up
  visit ('/')
  fill_in('username', with: 'gwpmad')
  fill_in('email', with: 'george@test.com')
  fill_in('password', with: '12345')
  fill_in('name', with: 'George')
end

def post_peep
  fill_in('peep', with: 'Yo, this is my peep')
  click_button('Post Peep')
end
