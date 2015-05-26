 module SessionHelpers

  def sign_in(email, password)
    visit '/sessions/new'
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'Come on in'
  end

  def sign_up(email: 'alib@b@@example.com', name: 'Ali', username:'Alib@b@', password: 'genius!', password_confirmation:'genius!')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Join Chatter!'
  end

  def add_peep(peep)
    within('#new-peep') do
      fill_in 'peep', with: peep
      click_button 'Add Peep'
    end
  end
end





