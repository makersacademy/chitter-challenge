feature 'Sign Up' do
  before(:each) do
    sign_up
  end

  scenario 'It confirms who is signed in on homepage' do
    expect(page).to have_content("You are signed up as Kennethy")
  end

  context "signed up user has added one peep" do
    before(:each) do
      add_peep1
    end
    scenario 'It registers new peeps in the new name' do
      expect(page).to have_content("Kennethy")
    end
    scenario 'It does not change the username for old peeps' do
      visit('/')
      click_link("Sign-up")
      fill_in("username", with: "Margaret")
      click_button("Sign-up")
      add_peep1
      expect(page).to have_content("Kennethy")
    end
    scenario 'User can be changed more than once' do
      visit('/')
      click_link("Sign-up")
      fill_in("username", with: "Roger")
      click_button("Sign-up")
      add_peep1
      expect(page).to have_content("Roger")
    end
    scenario 'Can switch back to an old user' do
      visit('/')
      click_link("Sign-up")
      fill_in("username", with: "Kennethy")
      click_button("Sign-up")
      add_peep2
      expect(page).to have_content("Kennethy: \"my second peep\"")
    end
  end

end
