feature 'Registration' do
  scenario 'User can sign up' do
    visit '/users/new'
    fill_in :email, with: 'test@example.com'
    fill_in :password, with: 'test123'
    fill_in :name, with: 'Tester Test'
    fill_in :username, with: 'TTest'
    click_button('Submit')
    expect(page).to have_content("Welcome, TTest!")
  end
end