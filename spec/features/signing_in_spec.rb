feature 'User sign in' do
  scenario 'with correct credentials' do
    user = create(:user)
    sign_in(user)
    expect(page).to have_content("Signed in as #{user.username}")
  end
end