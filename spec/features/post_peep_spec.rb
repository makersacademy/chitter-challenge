feature 'post peep' do
  scenario 'user can post a peep to chitter' do
    visit ('/chitter')
    fill_in(:name, with: 'Imogen Misso')
    fill_in(:username, with: 'imogenmisso123')
    fill_in(:peep, with: 'My first peep')
    click_button('Post')
    expect(page).to have_content 'My first peep by Imogen Misso(imogenmisso123)'
  end
end
