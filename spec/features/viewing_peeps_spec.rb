feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter Manager"
  end
end

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    Peep.add(text: "Peep 1")
    Peep.add(text: "Peep 2")
    Peep.add(text: "Peep 3")

    visit('/peeps')

    expect(page).to have_content "Peep 1"
    expect(page).to have_content "Peep 2"
    expect(page).to have_content "Peep 3"
  end
end
