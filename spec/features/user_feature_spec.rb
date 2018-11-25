feature 'user class' do
  scenario 'Adding a user to Chitter' do
    visit('/chitter/users')
    fill_in('username', with: 'testuser')
    fill_in('password', with: 'testpassword')
    click_button('Submit')
    expect(page).to have_content "You have signed up!"
  end
end
