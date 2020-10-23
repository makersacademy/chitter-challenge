feature "delete" do
  before do
    Peep.create(username: "kiriarf", body: "test1")
    Peep.create(username: "kiriarf", body: "test2")
  end

  scenario "user can click a delete button and delete a peep" do
    peeps = Peep.all.sort_by { |peep| peep.posted_on }.reverse
    first_peep, second_peep = peeps[0], peeps[1]

    visit('/')
    expect(page).to have_content("@kiriarf: test1")
    expect(page).to have_content("@kiriarf: test2")

    within("div##{first_peep.id}") do
      click_button("Delete")
    end

    expect(current_path).to eq '/'
    expect(page).not_to have_content("@kiriarf: test2")
    expect(page).to have_content("@kiriarf: test1")
  end
end