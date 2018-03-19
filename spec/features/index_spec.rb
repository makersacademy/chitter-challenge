feature 'See peeps' do
  scenario 'A user can see a peep' do
    visit('/')
    expect(page).to have_content "0th"
    expect(page).to have_content "1st"
    expect(page).to have_content "2nd"
  end
end

feature 'Submit a peep' do
  scenario 'A user can submit a peep' do
    visit('/')
    fill_in 'txt', with: 'Peep'
    click_button 'Post'
    expect(page).to have_content('Peep')
  end
end
