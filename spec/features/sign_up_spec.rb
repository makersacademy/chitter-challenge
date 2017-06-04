feature 'I can post messages on Chitter as me' do
  scenario 'I can sign in with a username' do
    sign_up
    expect(page).to have_content 'Welcome to Chitter, Rupert'
  end

  scenario 'I can sign in with a unique username' do
    expect { sign_up(user_email: nil) }.not_to change(User, :count)
    expect(page).to have_content 'Please provide a valid email address'
  end
end
