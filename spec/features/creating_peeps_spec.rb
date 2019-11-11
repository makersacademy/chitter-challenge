feature 'Adding a new peep' do
  scenario 'A Maker can add a peep to ChitterApp' do
    visit('/peeps/new')
    fill_in('title', with: 'Lorem ipsum dolor')
    fill_in('author', with: 'Robert Nester-Fuiller')
    fill_in('url', with: 'http://www.lipsum.com')
    fill_in('message', with: 'The quick red fox jumped over the lazy brown dog.')
    click_button('Submit')

    expect(page).to have_link('Lorem ipsum dolor', href: 'http://www.lipsum.com')
  end
end
