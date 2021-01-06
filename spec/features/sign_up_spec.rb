feature 'Sign Up' do
  before(:each) do
    sign_up("Kennethy")
  end

  scenario 'It confirms who is signed in on homepage' do
    expect(page).to have_content("You are signed up as: Kennethy")
  end

  context "sign in with user name that already exists" do
    before(:each) do
      sign_up("Kennethy")
    end
    scenario 'it returns user to a sign-up-failure page' do
      expect(page).to have_current_path('/sign-up/failed')
    end
    scenario 'it dsiplays an error message' do
      expect(page).to have_content('Sorry, that username already exists!')
    end
  end

  context "original signed up user has added one peep" do
    before(:each) do
      add_peep1
    end
    scenario 'It registers new peeps in the new name' do
      expect(page).to have_content("Kennethy")
    end
    scenario 'It does not change the username for old peeps' do
      sign_up("Margaret")
      add_peep1
      expect(page).to have_content("Kennethy")
    end
    scenario 'User can be changed more than once' do
      sign_up("Margaret")
      add_peep1
      sign_up("Roger")
      add_peep1
      expect(page).to have_content("Roger")
    end
  end

end
