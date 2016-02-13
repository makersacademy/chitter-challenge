
def visit_and_peep(custom_message)
  visit '/'
  click_link('Compose Peep')
  fill_in :message, with: custom_message
  click_button 'Peep'
end

def sign_up
  visit '/'
  click_link('Sign Up')
  fill_in :email, with: 'test@mail.com'
  fill_in :password, with: 'abc123'
  fill_in :password_confirmation, with: 'abc123'
  click_button('Sign Up')
end
