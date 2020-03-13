feature "testing infrastructure" do
  scenario "Can visit page and see text" do
    visit ('/users/new')
    fill_in('email', with: 'will@email.com')
    fill_in('password', with: 'password')
    fill_in('name', with: 'will')
    fill_in('username', with: 'itswill')
    expect(page).to have_content "Welcome to chitter itswill"
  end
end
