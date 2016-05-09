feature "view peeps" do

  before do
    sign_up
    create_peep
  end

  scenario "view list of peeps as the homepage" do
    visit "/"
    expect(page).to have_content "My first peep"
  end

  scenario "view list of peeps" do
    create_peep("My second peep")
    visit "/peeps"
    expect(page).to have_content "My first peep"
    expect(page).to have_content "My second peep"
  end

  scenario "view list of peeps in reverse chronological order" do
    Timecop.travel(60) do
      create_peep("My second peep")
      first_peep_index = page.body.index("My first peep")
      second_peep_index = page.body.index("My second peep")
      expect(first_peep_index).to be > second_peep_index
    end
  end
end
