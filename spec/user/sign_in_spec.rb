feature 'User sign in' do
  scenario 'I can sign in with correct credentials' do
    sign_up
    sign_in
    expect(current_path).to eq '/'
  end

  scenario 'I can not sign in with incorrect password' do
    sign_up
    sign_in(password: 'wrong')
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content 'The email or password is incorrect'
  end

  scenario 'I can not sign in with incorrect password' do
    sign_up
    sign_in(email: 'wrong')
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content 'The email or password is incorrect'
  end
end
