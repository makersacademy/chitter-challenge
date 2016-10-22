feature 'Viewing Peeps' do
  scenario 'I can see existing peeps on the peeps page' do
    Peep.create(name: 'TheDude', message: 'Hi all my peeps!!!', time: '09:00')
    visit '/peeps'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Hi all my peeps!!!')
  end
end
