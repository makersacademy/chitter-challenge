feature 'Peeps Page' do
  scenario 'User goes to peeps page and sees all peeps listed' do
    visit('/peeps')
    expect(page).to have_content 'Peep feed:'
  end
end
