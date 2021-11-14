feature 'login' do
  scenario 'user can login to chitter' do
    signup
    click_link "Login"
    fill_in :username, with: "Joe Bloggs"
    fill_in :email, with: "joe@gmail.com"
    click_button "Login"
    expect(page).to have_content "Joe Bloggs"
  end
end
