feature 'Viewing homepage' do

  scenario 'viewing main' do
    visit('/')
    expect(page).to have_content "chitter"
  end
end
feature 'view peeps' do
  scenario 'viewing all peeps' do
    visit('/peeps')
    Peep.create(peep: 'testing')
    Peep.create(peep: 'test')
    visit('/peeps')
    expect(page).to have_content('testing')
    expect(page).to have_content('test')
  end
end
