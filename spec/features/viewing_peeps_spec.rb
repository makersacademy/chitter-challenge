feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    Peep.create(content: 'peep 1')
    Peep.create(content: 'peep 2')
    Peep.create(content: 'peep 3')

    visit('/peeps')

    expect(page).to have_content "peep 1"
    expect(page).to have_content "peep 2"
    expect(page).to have_content "peep 3"
  end
end
