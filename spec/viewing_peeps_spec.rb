feature 'Viewing peeps' do
  before(:each) do
    Peep.create(content: 'This is a peep about dogs', tags: [Tag.first_or_create(name: 'canine')])
    Peep.create(content: 'This is a peep about cats', tags: [Tag.first_or_create(name: 'feline')])
    Peep.create(content: 'This is a peep about cows', tags: [Tag.first_or_create(name: 'bovine')])
    Peep.create(content: 'This is a peep about birds', tags: [Tag.first_or_create(name: 'avian')])
  end

  scenario 'I can see existing peeps on the peeps page' do
    Peep.create(content: 'This website is so cool')
    visit '/peeps'
    expect(page.status_code).to eq 200
    expect(page).to have_content('This website is so cool')
  end

  scenario 'I can filter peeps by tag' do
    visit '/tags/feline'
    expect(page.status_code).to eq(200)

    expect(page).not_to have_content('This is a peep about dogs')
    expect(page).to have_content('This is a peep about cats')
    expect(page).not_to have_content('This is a peep about cows')
    expect(page).not_to have_content('This is a peep about birds')

  end
end
