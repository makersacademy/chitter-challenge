feature "postin peeps" do
  scenario "user can post peeps" do
    sign_in
    fill_in "peep", with: "That was a looooong day"
    click_button "Peep"
    expect(page).to have_content "Ben09: That was a looooong day"
  end
end

feature "viewing peeps" do
  before do
    Peep.create(author: "Jonny", content: "Anything new", created: "16-08-01 12:00")
    visit"/"
    click_button "Chitter Main"
  end
  scenario "peeps are displayed without logging in" do
    expect(page).to have_content "Jonny: Anything new"
  end
  scenario "peeps are displayed with creation time" do
    expect(page).to have_content "(01-08-16 12:00)"
  end
end
