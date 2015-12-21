feature 'User can sign in' do
  scenario 'A user can sign in' do
    sign_in
    expect(current_path).to eq '/chat'
    expect(page).to have_content 'Welcome, htunny!'
  end

  scenario 'raises error when password enetered incorrectly' do
    sign_in(password: 'Banana')
    expect(current_path).to eq '/session/new'
    expect(page).to have_content 'Password incorrect'
  end
end
