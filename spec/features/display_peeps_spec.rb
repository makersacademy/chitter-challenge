feature "Displaying peeps" do
  scenario "a user can see a peep" do
    peep = Peep.create(
      name: "Dack Jorsey",
      username: "dack",
      content: "just setting up my chttr"
    )
    visit('/peeps')
    expect(page).to have_content "just setting up my chttr"
  end

  scenario "peeps are displayed with newest at top" do
    peep_1 = Peep.create(
      name: "Dack Jorsey",
      username: "dack",
      content: "just setting up my chttr"
    )
    peep_2 = Peep.create(
      name: "Dave K",
      username: "davek87",
      content: "Another tweet by a different user"
    )

    visit('/peeps')

    expect(page).to have_content "Another tweet by a different user"
    expect(page).to have_content "just setting up my chttr"
    expect(peep_2.content).to appear_before(peep_1.content)
  end

  scenario "peeps display user and username, along with content" do
    peep = Peep.create(
      name: "Dack Jorsey",
      username: "dack",
      content: "just setting up my chttr"
    )
    visit('/peeps')

    expect(page).to have_content "just setting up my chttr"
    expect(page).to have_content "@dack"
    expect(page).to have_content "Dack Jorsey"
  end

  scenario "peeps display time and date peep was posted" do
    peep = Peep.create(
      name: "Dack Jorsey",
      username: "dack",
      content: "just setting up my chttr"
    )
    time = "#{Time.now.strftime("%k:%M")} - #{Time.now.strftime("%d/%m/%Y")}"
    visit('/peeps')

    expect(page).to have_content "just setting up my chttr"
    expect(page).to have_content "@dack"
    expect(page).to have_content "Dack Jorsey"
    expect(page).to have_content time
  end
end
