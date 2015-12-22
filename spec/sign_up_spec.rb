feature 'Signing up to Chitter' do
  user = User.new(name: 'Katie', username: 'Smithy', email: 'K@email.com', password: 'secret', password_confirmation: 'secret')



  scenario 'A user can sign up' do
    sign_up(user)
    expect{ click_button 'Submit' }.to change(User, :count).by(1)
  end

  scenario 'A user cannot sign up with a username that is already taken' do
    user2 = User.new(name: 'Jack', username: 'Smithy', email: 'new@email.com', password: 'sky', password_confirmation: 'sky')

    sign_up(user)
    click_button 'Submit'
    sign_up(user2)
    expect{ click_button 'Submit' }.to change(User, :count).by(0)
  end
end
