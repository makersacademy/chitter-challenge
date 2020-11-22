feature 'viewing index page' do
  scenario 'there are no peeps to see' do
    visit('/peeps')

    expect(page).to have_content 'No peeps.'
    expect(page).to have_link('Add peep')
  end
end
