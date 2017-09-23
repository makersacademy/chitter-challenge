feature 'Viewing peeps' do
  before(:each) do
    Peep.create(message: 'This is my first peep.')
    Peep.create(message: 'This is my second peep.')
    Peep.create(message: 'This is my third peep.')
    Peep.create(message: 'This is my fourth peep.')
  end

  scenario 'I can see existing peeps on the peeps page' do
    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('This is my first peep.')
    end
  end

  scenario 'Existing peeps are in reverse chronological order' do
    visit '/peeps'
    page.body.index('This is my fourth peep.').should < page.body.index('This is my third peep.')
    page.body.index('This is my third peep.').should < page.body.index('This is my second peep.')
    page.body.index('This is my second peep.').should < page.body.index('This is my first peep.')
  end
end
