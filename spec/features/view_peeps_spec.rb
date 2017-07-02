feature 'Viewing peeps' do
  scenario 'Page displays time peep was peeped' do
    time1 = "2017-07-01T13:25:59+01:00"
    time2 = "2017-07-01T14:25:59+01:00"
    Peep.create(content: 'This is my second peep!')
    visit('/peeps')
    within 'ul#peeps' do
      time = Time.now
      time = time.strftime("%H:%M")
      expect(page).to have_content 'This is my first peep!'
      expect(page).to have_content time
    end
  end
  scenario 'Username is dislayed with peep' do
    Peep.create(content: 'This is my third peep!', creator: 'vhonebon1')
    visit('/peeps')
    expect(page).to have_content 'vhonebon1'
  end
end
