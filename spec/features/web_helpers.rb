
def submit_post_1
  visit('/posts/new')
  fill_in('title', with: 'Test Post 1')
  fill_in('body', with: 'This is Chitter test post 1')
  click_button('Post')
end

def submit_post_2
  visit('/posts/new')
  fill_in('title', with: 'Test Post 2')
  fill_in('body', with: 'This is Chitter test post 2')
  click_button('Post')
end

def sign_up(email: 'fake@email.com', password: '12345', password_confirmation: '12345')
  visit('/signup/new')
  fill_in(:email, with: email)
  fill_in(:password, with: password)
  fill_in(:password_confirmation, with: password_confirmation)
  fill_in(:name, with: 'Lewis Youl')
  fill_in(:username, with: 'Megadrive')
  click_button('Sign Up')
end
