def new_user_sign_up(email, password, username, name)
  visit '/users/new'
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :username, with: username
  fill_in :name, with: name
  click_button 'Submit'
end

def user_log_in(email, password)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button("Submit")
end

def sign_up_and_peep(peep)
  new_user_sign_up('foo@foo.com', '123secret', 'foo', 'Foo McFooface')
  visit '/peeps/new'
  fill_in :content, with: peep
  click_button 'Send'

end
