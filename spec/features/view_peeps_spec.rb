feature 'Viewing peeps' do

  before(:each) do
    Peep.create(message: 'I love pancakes!', tags: [Tag.first_or_create(name: 'food')])
    Peep.create(message: 'Nutella. Nuff said.', tags: [Tag.first_or_create(name: 'food')])
    Peep.create(message: 'Yeaaa!! :D', tags: [Tag.first_or_create(name: 'happy')])
  end

  scenario 'filter peeps by tag' do
    visit '/peeps/food'
    expect(page.status_code).to eq 200

    within 'ol#peeps' do
      expect(page).to have_content('I love pancakes!')
      expect(page).to have_content('Nutella. Nuff said.')
      expect(page).not_to have_content('Yeaaa!! :D')
    end
  end
end
