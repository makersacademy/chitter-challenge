xfeature 'Login' do
  scenario 'After registering an account maker wants to login to Chitter' do
    login
    expect(page).to have_content "Welcome back Jamie Lem!"
  end
end
