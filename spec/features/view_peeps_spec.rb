require './app/models/peep'

feature "peep list" do
  scenario "User can view a list of peeps without login" do
    Peep.create(content: "My first peep")
    visit '/peeps'
    expect(page.status_code).to eq 200
    within "ul#peeps" do
    expect(page).to have_content "My first peep"
    end
  end
end
