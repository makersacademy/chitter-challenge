feature 'displays peeps' do
  scenario 'user can view peeps in reverse chronological order' do
    visit('/peeps')
    expect(page). to have_content "These are all the peeps"
  end
end
