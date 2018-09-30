already_used_message = 'Username or email already in use, please try again'

feature 'the user cannot sign up to chitter' do
  scenario 'with an already used username' do
    sign_up_for_chitter('Billy', 'billy1', 'billy2@mail.com', 'password')
    expect(page).to have_content already_used_message
  end
end

feature 'the user cannot sign up to chitter' do
  scenario 'with and already used email' do
    sign_up_for_chitter('Billy', 'billy2', 'billy@mail.com', 'password')
    expect(page).to have_content already_used_message
  end
end
