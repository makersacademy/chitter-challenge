feature "feed" do
  before :each do
    Peep.create(content: "Test post", poster_id: 1)
    Peep.create(content: "Second peep", poster_id: 1)
    Peep.create(content: "P33P", poster_id: 1)
  end
  scenario "when visiting /peeps you see any existing peeps" do
    visit "/peeps"
    expect(page).to have_content("Test post")
    expect(page).to have_content("Second peep")
    expect(page).to have_content("P33P")
  end
  scenario "when visiting /peeps each peep has a timestamp" do
    now = DateTime.now.strftime("%Y-%m-%d %I:%M:%p")
    Peep.create(content: "P44P", poster_id: 1, id: 44)
    visit "/peeps"
    expect(find_by_id(44)).to have_content now
  end
  scenario "when visiting /peeps each peep shows the name of the user who posted it" do
    visit "/peeps"
    expect(find_by_id(1)).to have_content "ds.danielh"
  end
  scenario "peeps are shown in the order they were posted, latest first" do
    visit "/peeps"
    expect(page.body).to match(/P33P.*Second peep.*Test post/m)
  end
end
