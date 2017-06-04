feature 'I can post messages on Chitter as me' do
  scenario 'I can sign in with a username' do
    sign_up
    expect(page).to have_content 'Welcome to Chitter, Rupert'
  end

  scenario 'I can sign in with a unique username' do
    expect { sign_up(user_email: nil) }.not_to change(User, :count)
    expect(page).to have_content 'Please provide a valid email address'
  end

  scenario 'My messages show up as having my name' do
    sign_up
    post_new_message
    expect(page).to have_content 'Posted by Rupert'
  end

  scenario 'user signs up for account with email and password and requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Password and confirmation password do not match'
  end
end
