feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter"
  end
end

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    Peep.add(text: "Peep 1", name: "Name 1")
    Peep.add(text: "Peep 2", name: "Name 2")
    Peep.add(text: "Peep 3", name: "Name 3")

    visit('/peeps')

    p Peep.all
    expect(page).to have_content("Peep 1","Name 1")
    expect(page).to have_content("Peep 2","Name 2")
    expect(page).to have_content("Peep 3","Name 3")
  end
end
