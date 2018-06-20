def sign_up
  visit '/users/new'
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'password123')
  fill_in('name', with: 'Test name')
  fill_in('username', with: 'testusername')
  click_button('Submit')
end

def post_peep
  fill_in('peep', with: "This peep is very profound")
  fill_in('username', with: "Simone")
  click_button('Post')
end

def post_another_peep
  fill_in('peep', with: "This one is not, it is just a cat GIF")
  fill_in('username', with: "Simone")
  click_button('Post')
end

def post_long_peep
  fill_in('peep', with: "This peep is way too long, and I'm expecting to \
    receive an error message for trying to post it. It just goes on, and on, \
    and on, and on.......")
  fill_in('username', with: "Simone")
  click_button('Post')
end
