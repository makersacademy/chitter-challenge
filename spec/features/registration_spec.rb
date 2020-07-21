feature 'registration' do
  scenario 'a user can sign up' do
    visit('/users/new')
    fill_in('email', with: 'cat@email.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Cat')
    fill_in('username', with: 'catty')
    click_button('Submit')
    expect(page).to have_content 'Welcome, cat@email.com'
  end
end
