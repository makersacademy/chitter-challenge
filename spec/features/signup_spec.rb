feature 'sign up' do
  scenario 'a user can sign up to chitter' do
    visit('/users/new')
    fill_in('email', with: 'jake@gmail.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Jake')
    fill_in('username', with: 'Jake')
    click_button('Submit')

    expect(page).to have_content "Welcome, jake@gmail.com"
  end
end
