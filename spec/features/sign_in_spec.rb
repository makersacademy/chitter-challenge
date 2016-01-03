feature 'User Sign In' do
  scenario 'user can sign in' do
    sign_in
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Signed in as Test User'
  end

  scenario 'user cannot sign in if email is incorrect' do
    sign_in(email: 'muffins@example.com')
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content 'Invalid email or password'
  end

  scenario 'user cannot sign in if password is incorrect' do
    sign_in(password: 'mittensarentkittens')
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content 'Invalid email or password'
  end
end
