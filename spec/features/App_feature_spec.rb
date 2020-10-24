require 'pg'

feature 'viewing /peeps' do
  scenario 'it displays peep text' do
    Peep.create(peep_text: "My first peep", time: "NOW")
    Peep.create(peep_text: "My second peep", time: "NOW")
    visit('/peeps')
    expect(page).to have_content("My first peep")
    expect(page).to have_content("My second peep")
  end
end

feature 'Adding a new peep' do
  scenario 'A user can post a peep' do
    timenow = Time.now.to_s
    visit('/peeps/new')
    fill_in('peep_text', with: "This is a peep")
    fill_in('time', with: "NOW")
    expect(page).to have_content("This is a peep")
    expect(page).to have_content(timenow[0...19])
  end
end
