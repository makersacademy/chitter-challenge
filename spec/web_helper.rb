def sign_up(name: 'Misa Ogura',
            username: 'jinis',
            email: 'jinis@aol.jp',
            password: 'jinis1219',
            password_confirmation: 'jinis1219')
  visit('/')
  fill_in('name', with: name)
  fill_in('username', with: username)
  fill_in('email', with: email)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password_confirmation)
  click_button('Sign up')
end

def log_in(email: 'jinis@aol.jp',
           password: 'jinis1219')
  visit('/sessions')
  fill_in('email', with: email)
  fill_in('password', with: password)
  click_button('Log in')
end

def log_out
  click_button('Log out')
end

def post_peep(message: 'Test post')
  fill_in('message', with: message)
  click_button('Peep')
end

def comment
  fill_in('comment', with: 'Test comment')
  expect{ click_button('Comment') }.to change(Comment, :count).by(1)
end
