feature 'Signing up a new user' do
  scenario 'Signing up a user' do
    sign_up
    expect(page).to have_content('newuser')
  end
end
