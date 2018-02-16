feature 'Displays Peeps' do
  scenario 'User can view all recent Peeps' do
    visit '/'
    expect(page).to have_content "This is a test tweet"
    expect(page).to have_content "Look at me; I'm tweeting!"
    expect(page).to have_content "Who wants to follow me?"
  end
end
