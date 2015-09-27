feature 'Viewing chits' do

  scenario 'I can see existing chits on the chits page' do
    Chit.create(post: 'hello')
    visit '/chits'
    expect(page.status_code).to eq 200
    within 'ul#chits' do
      expect(page).to have_content('hello')
    end
  end

  before(:each) do
    Chit.create(post: 'hello',
                tags: [Tag.first_or_create(name: 'happy')])
    Chit.create(post: 'goodbye',
                tags: [Tag.first_or_create(name: 'sad')])
    Chit.create(post: 'smile',
                tags: [Tag.first_or_create(name: 'happy')])
    Chit.create(post: 'frown',
                tags: [Tag.first_or_create(name: 'sad')])
  end

  scenario 'I can filter chits by tag' do
  visit '/tags/happy'
  within 'ul#chits' do
    expect(page).not_to have_content('goodbye')
    expect(page).not_to have_content('frown')
    expect(page).to have_content('hello')
    expect(page).to have_content('smile')
  end
end
end
