feature 'User can sign in to Chitter' do
  scenario 'User can register and sign in with account' do
    sign_up
    expect(page).to have_content 'Hi, BloggsyMalone'
  end
  scenario 'User cannot sign in with wrong credentials' do
    sign_up
    sign_in(password: 'wrong')
    expect(page).to have_content 'The email or password is incorrect'
  end
end
