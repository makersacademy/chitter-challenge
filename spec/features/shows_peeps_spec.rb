require 'pg'

feature 'Chitter' do
  scenario 'shows a list of peeps' do
    Chitter_peeps.create(peep: "Hello new peeps, what is up")
    visit '/peeps'
    expect(page).to have_content "Hello new peeps, what is up"
  end
end
