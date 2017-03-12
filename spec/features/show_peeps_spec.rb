feature 'show all peeps' do
  scenario 'show a list of all peeps on the peeps route' do
    visit '/peeps'
    Peep.create(message:'Test Peep!!')
    visit '/peeps'
    expect(page).to have_content('Test Peep!!')
  end
end
