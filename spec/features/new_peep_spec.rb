feature "adding peeps" do
  before do
    visit '/'
    click_button 'New Peep'
  end

  scenario "user can view a form for adding peeps" do
    expect(page).to have_field("content")
  end

  context "user adds a peep" do
    before do
      fill_in("content", with: "FAKE NEWS!")
      click_button 'Submit'
    end

    scenario "user can see content on the peeps page" do
      expect(page).to have_content 'FAKE NEWS!'
    end

    scenario "user can see username on peeps page" do
      expect(page).to have_content 'posted by TestUser'
    end

    scenario "user can see time of post on the peeps page" do
    end

  end



end
