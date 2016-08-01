feature 'User sign in' do
  scenario 'I can sign in with correct credentials' do
    create_user
    sign_in
    expect(current_path).to eq '/'
  end

  scenario 'I can not sign in with incorrect password' do
    create_user
    sign_in(password: 'wrong')
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content 'The email or password is incorrect'
  end

  scenario 'I can not sign in with incorrect email' do
    create_user
    sign_in(email: 'wrong')
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content 'The email or password is incorrect'
  end
end
