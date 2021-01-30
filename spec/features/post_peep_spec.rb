feature "user to post message" do
  scenario "to display a peep" do
    connection = PG.connect(dbname: 'chitter_manager_test')
    connection.exec("INSERT INTO peeps (message) VALUES ('Hello Chitter!')")
    visit '/peeps'
    # fill_in "peep", with: "Hello chitter!"
    # fill_in "user", with: "Louis"
    # click_on "Post Peep!"
    expect(page).to have_content "Hello Chitter!"
  end

  feature 'Posting a new peep' do
    scenario 'A user can post a peep to Chitter' do
      connection = PG.connect(dbname: 'chitter_manager_test')
      connection.exec("INSERT INTO peeps (message) VALUES ('Hello Chitter!')")
      visit('/peeps/new')
      fill_in('peep', with: 'How are you?')
      click_button('Post Peep!')
      expect(page).to have_content 'How are you?'
    end
  end
end
