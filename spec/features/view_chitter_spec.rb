feature 'view Chitter' do
  scenario 'visit Chitter page and see a list of peeps' do
    Peep.create(content: "Fake news!")
    Peep.create(content: "Sun''s out, guns out")

    visit '/chitter'

    expect(page).to have_content('Chitter')
    expect(page).to have_link('Compose new peep', href: '/chitter/new')
    expect(page).to have_content('Fake news!')
    expect(page).to have_content("Sun's out, guns out")
  end

  scenario 'peeps are listed in reverse chronological order' do
    Peep.create(content: "First peep")
    Peep.create(content: "Second peep")

    visit '/chitter'

    expect("Second peep").to appear_before("First peep")
  end
end
