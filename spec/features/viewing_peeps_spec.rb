feature 'Viewing peeps' do
  scenario 'peeps can be viewed' do
    Peep.create_peep(message: 'test peep 1')
    Peep.create_peep(message: 'test peep 2')
    Peep.create_peep(message: 'test peep 3')

    visit '/peeps'

    expect(page).to have_content('test peep 1')
    expect(page).to have_content('test peep 2')
    expect(page).to have_content('test peep 3')
  end
end
