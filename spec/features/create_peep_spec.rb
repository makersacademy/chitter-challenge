require 'pg'

feature "Add a new peep" do
  scenario "User can add a new peep to Chitter" do
    sample_peep = 'This is a sample peep with my latest and greatest thought'
    visit '/add_new_peep'
    expect(page).to have_field("peep")
    fill_in('peep', with: sample_peep)
    click_button 'Submit'
    expect(page).to have_content(sample_peep)

  end
end
