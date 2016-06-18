feature 'Viewing Peeps' do
  scenario 'when you visit the homepage you can see the peeps' do
    visit('/')
    expect(page.status_code).to eq(200)
    expect(page).to have_content('Peeps')
  end

  scenario 'You can see the peep that you created' do
    visit('/peeps')
    Peep.create(message: 'This is my first peep', time: Time.now.strftime(Chitter::TIME_FORMAT))
    within('ul#peeps') do
      expect(page).to have_content('This is my first peep')
    end
  end
end
