def send_a_peep
  visit('/peep')
  fill_in('enter_peep', with: 'Hello, Chitter world!')
  click_button 'peep'
end

def sign_up_for_chitter
  visit('/')
  click_button 'Sign up'
  fill_in('enter_name', with: 'Henry Ford')
  fill_in('enter_email', with: 'hford@gmail.com')
  click_button 'Sign up'
end