feature 'peeps' do
  
  scenario "it should show a list of peeps" do
    Peep.create(title: "Test", peep: "this is a test peep")
    Peep.create(title: "Hello", peep: "feeling ok")
    Peep.create(title: "Bye", peep: "feeling sad")

    visit('/peeps')

    expect(page).to have_content "this is a test peep"
    expect(page).to have_content "feeling ok"
    expect(page).to have_content "feeling sad"
  end

  scenario 'it should add a peep to the list' do
    Peep.create(title: "Test", peep: 'this is a test peep')
    visit('/peeps')

    expect(page).to have_content "this is a test peep"
  end
end