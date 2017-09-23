feature 'When creating peeps' do
  scenario 'I can see my new peeps on the peeps page' do
    # As a Maker
    # So that I can let people know what I am doing
    # I want to post a message (peep) to chitter

    visit '/peeps'
    fill_in :peep_body, with: "I'm creeping and I'm peeping"
    click_button 'Peep'
    expect(page).to have_content("I'm creeping and I'm peeping")
  end
end
