require "user"

def sign_in
  user = User.create(name: "Elvis", email: 'test@example.com', password: 'password', receive_email: 'y')
  visit '/user'
  fill_in :name, with: 'Elvis'
  fill_in :password, with: 'password'
  click_button('submit')
  user.id
end

def sign_in_create_message
  user = User.create(name: "Elvis", email: 'test@example.com', password: 'password', receive_email: 'y')
  visit '/user'
  fill_in :name, with: 'Elvis'
  fill_in :password, with: 'password'
  click_button('submit')
  message = Message.create(sender: user.id,text: "Excellent Sherlock!")
  visit '/message'
  message.id
end
