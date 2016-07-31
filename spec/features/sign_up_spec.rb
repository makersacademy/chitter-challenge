feature 'Sign up' do
  scenario 'User can sign up to Chitter' do
    sign_up
    expect(page).to have_content 'Welcome to Chitter Mannie'
  end
end
