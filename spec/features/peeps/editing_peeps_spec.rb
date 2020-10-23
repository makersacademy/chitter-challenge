feature "edit" do
  before do
    Peep.create(username: "kiriarf", body: "BOTTOM TEXT")
  end

  scenario "user can edit the body of a peep" do
    peeps = Peep.all.sort_by { |peep| peep.posted_on }.reverse
    first_peep, second_peep = peeps[0], peeps[1]

    visit('/')
    expect(page).to have_content("BOTTOM TEXT")

    within("div##{first_peep.id}") do
      click_button("Edit")
    end

    fill_in "body",	with: ""
    fill_in "body",	with: "TOP TEXT"
    click_button("Submit Changes")

    expect(page).not_to have_content("BOTTOM TEXT")
    expect(page).to have_content("TOP TEXT")
  end
end