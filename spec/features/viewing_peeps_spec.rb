feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the peeps page' do
    Peep.create(post: 'hello')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('hello')
    end
  end

  before(:each) do
    Peep.create(post: 'hello',
                tags: [Tag.first_or_create(name: 'happy')])
    Peep.create(post: 'goodbye',
                tags: [Tag.first_or_create(name: 'sad')])
    Peep.create(post: 'smile',
                tags: [Tag.first_or_create(name: 'happy')])
    Peep.create(post: 'frown',
                tags: [Tag.first_or_create(name: 'sad')])
  end

  scenario 'I can filter peeps by tag' do
    visit '/tags/happy'
    within 'ul#peeps' do
      expect(page).not_to have_content('goodbye')
      expect(page).not_to have_content('frown')
      expect(page).to have_content('hello')
      expect(page).to have_content('smile')
    end
  end
end
