feature 'Viewing Peeps' do
  scenario 'I can see existing peeps on the peeps page' do
    Peep.create(name: 'TheDude', message: 'Hi all my peeps!!!')
    visit '/peeps'
    expect(page).to have_content('Hi all my peeps!!!')
  end
end
