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
  visit('/peeps/new')
  fill_in('content', with: content)
  within 'div#main' do
    click_button('Peep')
  end
end

def sign_in(email: 'example@domain.com', password: 'secret')
  User.create(name: 'example', email: 'example@domain.com',
              password: 'secret', password_confirmation: 'secret',
              handle: 'handle')
  visit('/sessions/new')
  fill_in('email', with: email)
  fill_in('password', with: password)
  click_button('Log in')
end

def populate_peeps(number)
  sign_up
  number.times do |n| 
    Peep.create(content: n.to_s, created_at: Time.now + n, poster_id: 1)
  end
  visit('/peeps')
end

