feature '2. Log In' do
  scenario 'User can log in' do
    signup
    login
    expect(page).to have_content 'Lauren\'s Profile'
  end
end
