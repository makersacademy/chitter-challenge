feature 'Posting a peep' do
  scenario 'A user posting a peep' do
    visit('/')
    expect(page).to have_content "My 1st peep"
    expect(page).to have_content "My 2nd peep"
    expect(page).to have_content "My 3rd peep"
  end
end
