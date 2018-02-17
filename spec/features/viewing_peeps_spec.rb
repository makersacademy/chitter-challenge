feature 'Displays Peeps' do
  scenario 'User can view all recent Peeps' do
    visit '/peeps/'
    expect(page).to have_content "This is a test peep"
    expect(page).to have_content "Look at me; I'm peeping!"
    expect(page).to have_content "Who wants to follow me?"
  end
end
