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
    scenario 'peeps belong to a user' do
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
        expect(page).to have_content("syalniz: hello world this is samed")
      end
    end
    scenario 'shows peeps in reverse order' do
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
    visit '/peeps'
    fill_in "post", with: "second entry should be first"
    click_button "peep message"
    within 'ul#peeps' do
      expect(page).to have_content("second entry should be first")

    end
  end
    scenario 'peeps show time when they were created' do
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
        expect(page).to have_content(Time.now)
      end
    end
    scenario 'only logged in users can peep' do
      visit'/sessions'
      expect(page).not_to have_content("peep message") #name of the peep button
    end
end
