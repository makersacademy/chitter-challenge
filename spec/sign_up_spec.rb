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
    expect{ click_button 'Submit' }.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Username is already taken'
  end

  scenario 'A user cannot sign up with an email that is already taken' do
    user2 = User.new(name: 'Jack', username: 'Jack123', email: 'K@email.com', password: 'sky', password_confirmation: 'sky')

    sign_up(user)
    click_button 'Submit'
    sign_up(user2)
    expect{ click_button 'Submit' }.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Email is already taken'
  end

  scenario 'A user can only sign up with a valid email' do
    user = User.new(name: 'Katie', username: 'Smithy', email: 'myemail.com', password: 'secret', password_confirmation: 'secret')
    sign_up(user)
    expect{ click_button 'Submit' }.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Email has an invalid format'
  end
end
