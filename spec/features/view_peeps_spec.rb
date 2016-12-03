feature "View Peeps" do

  scenario "I want to view all peeps" do
    visit '/peeps'
    expect(page.status_code).to eq 200
    expect(page).to have_content "Peeps:"
  end

  scenario "I want to view the name and username of the maker" do
    sign_up
    sign_in
    add_peep
    expect(page).to have_content "Tester"
    expect(page).to have_content "tester1"
  end

  scenario "I want to view the time at which the peep was created" do
    sign_up
    sign_in
    add_peep
    t = Time.now
    expect(page).to have_content t.strftime("%FT%R")
  end

  scenario "I want to view peeps in reverse chronological order" do
    sign_up
    sign_in

    visit '/peeps/new'
    fill_in :message, with: "First peep"
    click_button "Add Peep"

    visit '/peeps/new'
    fill_in :message, with: "Second peep"
    click_button "Add Peep"

    expect(page.body.index("Second peep") < page.body.index("First peep"))
  end
end
