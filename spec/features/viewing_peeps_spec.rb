feature 'Viewing Peeps' do
  scenario 'A user can see their Peeps' do
    visit('/peeps')
    expect(page).to have_content "Dear diary"
    expect(page).to have_content "Feeling blue"
    expect(page).to have_content "Happy thoughts"
  end
end
