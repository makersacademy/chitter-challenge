feature "displays peeps" do
  scenario "displays all peeps" do
    Peep.create(body: "New page whu dis")
    Peep.create(body: "seriously, what is this site")
    visit ("/home")

    expect(page).to have_content "New page whu dis"
    expect(page).to have_content "seriously, what is this site"
  end
end
