require './app/models/peep'

feature "add peep" do
  scenario "User can add a peep using a form if logged in" do
    create_log_in
    visit '/peeps/new'
    expect(page.status_code).to eq 200
    fill_in "peep", with: "My first peep"
    click_button "Peep"
    within "ul#peeps" do
      expect(page).to have_content "My first peep"
    end
  end
end
