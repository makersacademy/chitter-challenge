require 'pg'

feature 'viewing /peeps' do
  scenario 'it displays test text' do
    Peep.create(peep_text: "My first peep")
    Peep.create(peep_text: "My second peep")
    visit('/peeps')

    expect(page).to have_content("My first peep")
    expect(page).to have_content("My second peep")
  end
end

feature 'Adding a new peep' do
  scenario 'A user can post a peep' do
    Peep.create(peep_text: "This is a peep")
    visit('/peeps/new')

    fill_in('new_peep', with: 'This is a peep')
    click_button('Submit')
    expect(page).to have_content 'This is a peep'
  end
end
