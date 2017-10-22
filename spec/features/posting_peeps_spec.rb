require 'capybara'

feature 'Posting peeps' do
  scenario 'User posts a peep' do
    Peep.create(contents: "First peep")

    visit '/peeps'

    expect(page.status_code).to eq 200

    #maybe add a within block here
    expect(page).to have_content "First peep"
  end
end
