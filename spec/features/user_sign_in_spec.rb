feature 'User sign in' do

  scenario 'I can sign up as a new user' do
    sign_in
    expect(page).to have_content 'Welcome, kj'
  end

end
