feature "Signing up" do
  scenario "user can sign up and see welcome page" do
    visit ('/users/new')
    fill_in('email', with: 'will@email.com')
    fill_in('password', with: 'password')
    fill_in('name', with: 'will')
    fill_in('username', with: 'itswill')
    click_button 'Submit'
    expect(page).to have_content "Welcome, itswill"
  end
end
