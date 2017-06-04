module Helpers

  def post_new_message(message: "I do love this tartan scarf #ScarfsForBears #my_first_message")
    visit '/messages/new'
    fill_in :message, with: message
    click_button 'Peep'
  end

  def sign_up(user_name: 'Rupert', user_email: 'rupert@bears.com', password: 'passw0rd', password_confirmation: 'passw0rd')
    visit '/users/new'
    fill_in :user_name, with: user_name
    fill_in :user_email, with: user_email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign Up'
  end

  def sign_in(email: 'test_user@tests.test', password: 'testing123')
    visit '/sessions/new'
    fill_in :user_email, with: email
    fill_in :password, with: password
    click_button 'Submit'
  end

end
