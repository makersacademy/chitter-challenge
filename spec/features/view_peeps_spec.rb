feature 'View all Peeps on a timeline' do
  scenario 'User can see all peeps posted' do
    visit ('/peeps/timeline')

    expect(page).to have_content 'Test Peep'
    expect(page).to have_content 'I am a test peep'
    expect(page).to have_content 'Me too'
  end
end
