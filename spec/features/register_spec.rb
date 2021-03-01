feature 'registration' do
  scenario 'user registers' do
    visit ('/register')
    fill_in("username", with: "@jimbo")
    fill_in("password", with: "@123pass")
    fill_in("email", with: "jimmy@jimbo.biz")
    click_button("Submit")
    # fill_in("username", with: "@jimbo")
    # fill_in("password", with: "@123pass")
    # click_button("Submit")
    # expect(page).to have_content("Welcome @jimbo")
  end
end