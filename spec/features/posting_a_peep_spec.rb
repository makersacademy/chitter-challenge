feature 'Posting a peep' do
  scenario 'User sees posted peeps' do
    visit('/')
    expect(page).to have_content 'Test peep 2'
    expect(page).to have_content 'Test peep 3'
    expect(page).to have_content 'Test peep 4'
  end
end
