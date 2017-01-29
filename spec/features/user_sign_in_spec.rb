feature 'User can sign in to Chitter' do
  scenario 'User can register and sign in with account' do
    sign_up
    expect(page).to have_content 'Hi, joe@example.com'
  end
end
