feature "Feed" do
  scenario "user can see all the peeps" do
    Peep.create(text: "How does this work?")
    fake_user=Peep.create(text: "No idea")

    visit('/')

    expect(page).to have_content"No idea"
    expect(page).to have_content"How does this work?"


    end
  end
