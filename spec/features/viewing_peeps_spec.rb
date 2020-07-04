require 'pg'

feature 'Viewing peeps' do
  scenario 'viewing a list of peeps' do
    Peep.create(peep: "First Peep")
    Peep.create(peep: "Second Peep")

    visit '/'
    click_button 'View Peeps'
    visit '/peeps'

    expect(page).to have_content "First Peep"
    expect(page).to have_content "Second Peep"
  end

  scenario 'peeps page has a button to post a new peep' do
    visit '/peeps'
    expect(page).to have_button 'New Peep'
  end
end
