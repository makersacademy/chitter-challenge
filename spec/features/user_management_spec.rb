feature 'User sign up' do
  scenario 'Maker can sign up as a new user' do
    signup
    expect(page.status_code).to eq(200)
    expect(page).to have_content('Welcome,test@email.com')
    expect(User.first.email).to eq('test@email.com')
  end
end
