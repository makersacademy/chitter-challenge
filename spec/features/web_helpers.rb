def sign_up(name: 'Tadas Majeris',
            username: 'tadan',
            email: 'tadas@gmail.com',
            password: 'tadadoo',
            password_confirmation: 'tadadoo')

  visit '/users/new'
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Submit'
end

def sign_in(email: 'tadas@gmail.com', password: 'tadadoo')
  User.create(name: 'Tadas Majeris', username: 'tadan',
              email: 'tadas@gmail.com', password: 'tadadoo',
              password_confirmation: 'tadadoo')
  visit '/'
  click_button 'Sign in'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end

def peep(text)
  fill_in :peep_text, with: text
  click_button 'Peep'
end

def sign_in_and_peep
  sign_in
  peep("peep peep!")
end

def comment(text)
  within 'div.peep' do
    within 'div.comments' do
      fill_in :comment_text, with: text
      click_button 'reply'
    end
  end
end
