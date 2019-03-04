feature 'registration' do
  scenario 'a user can sign up' do
    visit '/user/new'
    fill_in('username', with: 'Anu')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content "Welcome, Anu"
  end
end
