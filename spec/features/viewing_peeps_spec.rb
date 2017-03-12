feature 'Viewing peeps' do

  before(:each) do
    Peep.create(content: 'A garden full of giraffes', hashtags: [Hashtag.first_or_create(name: 'animals')])
    Peep.create(content: 'Butternut squash risotto', hashtags: [Hashtag.first_or_create(name: 'food')])
    Peep.create(content: 'Bees in the springtime', hashtags: [Hashtag.first_or_create(name: 'animals')])
    Peep.create(content: 'New solar-system discovery', hashtags: [Hashtag.first_or_create(name: 'science')])
  end

  scenario 'user can filter peeps by hashtags' do
    visit '/hashtags/science'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).not_to have_content('A garden full of giraffes')
      expect(page).not_to have_content('Butternut squash risotto')
      expect(page).not_to have_content('Bees in the springtime')
      expect(page).to have_content('New solar-system discovery')

    end
  end

end
