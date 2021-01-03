feature 'Viewing peeps' do
  scenario 'A user can see all peeps' do
    Peep.create(content: "test peep")
    Peep.create(content: "another test peep")
    Peep.create(content: "a third test peep")

    visit('/peeps')

    expect(page).to have_content "test peep"
    expect(page).to have_content "another test peep"
    expect(page).to have_content "a third test peep"
  end

  scenario 'displays list in reverse chronological order' do
    Peep.create(content: "test peep")
    Peep.create(content: "another test peep")
    Peep.create(content: "a third test peep")

    visit('/peeps')

    page.body.index("a third test peep").should > page.body.index("another test peep")
    page.body.index("another test peep").should > page.body.index("test peep")
  end
end
