feature 'Posting new peeps' do
  scenario 'As an user, I can post a new peep' do
    visit '/peeps/new'

    fill_in :peep, with: "This is a peep"
    click_button "Peep"

    expect(page).to have_content "This is a peep"
  end
end
