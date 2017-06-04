def post_new_message(message: "I do love this tartan scarf #ScarfsForBears #my_first_message")
  visit '/messages/new'
  fill_in :message, with: message
  click_button 'Peep'
end

def sign_up(user_name: 'Rupert', user_email: 'rupert@bears.com')
  visit '/users/new'
  fill_in :user_name, with: user_name
  fill_in :user_email, with: user_email
  click_button 'Sign Up'
end
