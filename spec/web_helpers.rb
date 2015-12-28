module SessionHelpers

  def sign_up(name:     'chuck',
              email:    'chuckypdawg@gmail.com',
              username: 'chuckypdawg',
              password: '12345678',
              password_confirmation: '12345678')
    visit '/sign_up'
    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Submit'
  end
end
