feature 'listing peeps' do
  scenario 'user can see all peeps' do
    Chitter.create_peep('Imogen Misso', 'imogenmisso123', 'My first peep')
    visit '/'
    expect(page).to have_content 'My first peep'
  end
end
