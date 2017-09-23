feature 'Viewing peeps' do
  before(:each) do
    Peep.create(message: 'This is my first peep.', tags: [Tag.first_or_create(name: 'greeting')])
    Peep.create(message: 'This is my second peep.', tags: [Tag.first_or_create(name: 'greeting')])
    Peep.create(message: 'This is my third peep.', tags: [Tag.first_or_create(name: 'testing')])
    Peep.create(message: 'This is my fourth peep.', tags: [Tag.first_or_create(name: 'testing')])
  end

  scenario 'I can see existing peeps on the peeps page' do
    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('This is my first peep.')
    end
  end

  scenario 'Existing peeps appear in reverse chronological order' do
    visit '/peeps'
    page.body.index('This is my fourth peep.').should < page.body.index('This is my third peep.')
    page.body.index('This is my third peep.').should < page.body.index('This is my second peep.')
    page.body.index('This is my second peep.').should < page.body.index('This is my first peep.')
  end

  scenario 'I can filter peeps by tag' do
    visit '/tags/greeting'
    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).to have_content('This is my first peep.')
      expect(page).to have_content('This is my second peep.')
      expect(page).not_to have_content('This is my third peep.')
      expect(page).not_to have_content('This is my fourth peep.')
    end
  end
end
