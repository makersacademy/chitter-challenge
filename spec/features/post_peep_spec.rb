feature 'post peep' do
  scenario 'user can post a peep to chitter' do
    visit ('/')
    fill_in(:name, with: 'Imogen Misso')
    fill_in(:username, with: 'imogenmisso123')
    fill_in(:peep, with: 'My first peep')
    click_button('Post')
    expect(page).to have_content 'My first peep by Imogen Misso(imogenmisso123)'
  end

  scenario 'peeps are shown in reverse chronological order' do
    visit ('/')
    fill_in(:name, with: 'Imogen Misso')
    fill_in(:username, with: 'imogenmisso123')
    fill_in(:peep, with: 'My first peep')
    click_button('Post')
    fill_in(:name, with: 'Imogen Misso')
    fill_in(:username, with: 'imogenmisso123')
    fill_in(:peep, with: 'My second peep')
    click_button('Post')
    expect(page.body) =~ /My second peep.*My first peep/
  end 
end
