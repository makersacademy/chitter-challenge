feature 'a user signing up' do
  scenario 'a new user is added to the db' do
    register_new_user
    expect(page).to have_content('Signed in as: Bob')
    expect(page).not_to have_content('Register')
  end
end
