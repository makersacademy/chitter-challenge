feature 'see all peeps in reverse chronological order' do
  scenario 'when visiting the peeps path, you can see all peeps in reverse chronological order' do
    visit '/peeps'
    expect(page).to have_content 'First peep'
    expect(page).to have_content 'Second peep'
    expect(page.body.index('First peep')).to be < page.body.index('Second peep')
  end
end