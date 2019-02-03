feature 'Signing up' do
  scenario 'A user can sign up' do
    register_user
    expect(page).to have_content 'Welcome to Chitter, Test User'
  end
end
