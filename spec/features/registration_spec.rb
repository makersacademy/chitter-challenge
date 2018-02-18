feature 'Registration' do
  scenario 'A user can sign up' do
    visit '/users/new'
    fill_in('email', with: 'mynameis@email.com')
    fill_in('password', with: 'mostsecurepassword')
    click_button('Submit')
    expect(page).to have_content "Welcome, mynameis@email.com"
  end
end
