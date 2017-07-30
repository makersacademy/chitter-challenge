feature 'sign in' do
  scenario 'sign in with a valid password' do
    sign_in('user@email.com', '1234')
    expect(page).to have_content('Welcome to Peeper')
  end
end
