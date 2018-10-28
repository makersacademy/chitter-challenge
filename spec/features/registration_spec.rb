feature 'Feature - registration' do
  scenario 'a user can sign up' do
    visit('/users/new')
    fill_in('name', with: 'Joe Bloggs')
    fill_in('email', with: 'test@example.com')
    fill_in('username', with: 'user1')
    fill_in('password', with: 'pa33w0rd')
    click_button('Submit')

    expect(page).to have_content "Welcome, Joe Bloggs"
  end
end
