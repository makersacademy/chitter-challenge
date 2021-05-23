feature 'logging a user out' do
  it 'signs them out' do
    register_new_user
    click_button('Logout')
    expect(page).to have_content('Register')
    expect(page).not_to have_content('Signed in as: Bob')
  end
end
