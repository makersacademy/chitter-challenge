module SessionHelpers

  def signup(email: 'happyfriends@treehouse.com', username: 'HappyFriends99', password: 'password1234', password_confirmation: 'password1234')
    visit('/users/new')
    fill_in :email, with: email
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'submit'
  end

  def login(username: 'HappyFriends99', password: 'password1234', password_confirmation: 'password1234')
    visit '/sessions/new'
    fill_in :username, with: username
    fill_in :password, with: password
    click_button 'Sign In'
  end

  def peep
    visit '/peeps'
    click_button 'Write new tip'
    fill_in 'text', with: "The crotchet hook is a knitter's best friend"
    click_button 'Add Tip'
    expect(current_path).to eq '/peeps'
  end

  def reply
    visit '/peeps'
    click_button 'Reply'
    fill_in 'text', with: "Thats so true"
    click_button 'Submit Reply'
    expect(current_path).to eq '/peeps'
  end
end
