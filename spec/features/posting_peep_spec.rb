feature 'posting peeps to chitter' do
  scenario 'user can post a peep' do
    visit '/users'
    fill_in 'email', with: "s.yalniz@hotmail.de"
    fill_in 'password', with: "password123"
    fill_in 'password_confirmation', with: "password123"
    fill_in 'name', with: "Samed Yalniz"
    fill_in 'username', with: "syalniz"
    click_button "Sign up"
    visit'/sessions'
    fill_in "username", with: "syalniz"
    fill_in "password", with: "password123"
    click_button "Sign in"
    visit '/peeps'
    fill_in "post", with: "hello world this is samed"
    click_button "peep message"
    within 'ul#peeps' do
      expect(page).to have_content("hello world this is samed")
    end
  end
end
