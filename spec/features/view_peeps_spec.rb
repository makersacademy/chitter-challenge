feature 'view peep list' do
  scenario 'see list of all posted peeps on homepage' do
    visit('/')
    expect(page).to have_content('Test peep 1')
  end
end
