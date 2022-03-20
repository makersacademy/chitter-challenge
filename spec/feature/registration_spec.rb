feature 'registration' do
  scenario 'a user can sign up' do
    visit '/user/new'
    fill_in('email', with: 'gaya@gaya.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Gaya Skinner')
    fill_in('username', with: 'gskinner')
    click_button('Submit')

    expect(page).to have_content "Welcome, Gaya Skinner!"
  end
end