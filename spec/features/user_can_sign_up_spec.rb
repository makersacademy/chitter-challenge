feature 'Registration' do
  scenario 'A user can sign up and be welcomed' do
    visit '/peeps'
    click_button('New User')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Chrissy Wissy')
    fill_in('username', with: 'chrisc')
    click_button('Submit')

    expect(page).to have_content 'Welcome Chrissy Wissy, start peeping now!'
  end
end
