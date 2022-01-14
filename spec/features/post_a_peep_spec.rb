feature 'Posting peeps' do
  scenario 'A user can post a peep' do
    visit('/chitter')

    expect(page).to have_content "Test peep 1"
    expect(page).to have_content "Test peep 2"
    expect(page).to have_content "Test peep 3"
  end
end
