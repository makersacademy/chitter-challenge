def sign_up(name: 'person', password: 'secret', email: 'example@domain.com', 
            handle: 'example', confirmation: 'secret')
  visit('/users/new')
  fill_in('name', with: name)
  fill_in('password', with: password)
  fill_in('confirmation', with: confirmation)
  fill_in('handle', with: handle)
  fill_in('email', with: email)
  click_button('Complete')
end

def login(email: 'example@domain.com', password: 'secret')
  visit('/login')
  fill_in('email', with: email)
  fill_in('password', with: password)
  click_button('Login')
end

def peep(content: 'some text')
  visit('/peep/new')
  fill_in('content', with: content)
end
