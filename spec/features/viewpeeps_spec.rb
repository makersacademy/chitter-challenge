feature 'show all peeps in descending order' do
  scenario 'User follows a person and can now see their peeps in descending order' do
    Peep.create(message: 'Hello world')
    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps'
    expect(page).to have_content "Hello world"
    end

    scenario 'I want to see the time a peep is posted' do
      visit '/peeps/new'
      fill_in :message, with: "What\'s the time Mr Wolf?"
      click_button "Add peep"
      expect(page).to have_content "What\'s the time Mr Wolf?"
    end
  end
