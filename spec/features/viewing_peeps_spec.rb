feature 'Displays Peeps' do
  scenario 'User can view all recent Peeps' do
    visit '/peeps'
    expect(page).to have_content "This is a test peep"
  end
end
