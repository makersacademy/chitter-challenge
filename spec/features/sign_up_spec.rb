feature 'Sign up to Chitter' do
  scenario 'user makes a login for Chitter' do
    sign_up
    expect(page).to have_content "Chitter Feed"
  end
end
