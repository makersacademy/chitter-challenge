feature 'Viewing peeps' do
  scenario 'Page displays time peep was peeped' do
    time1 = "2017-07-01T13:25:59+01:00"
    time2 = "2017-07-01T14:25:59+01:00"
    Peep.create(content: 'This is my first peep!')
    visit('/peeps')
    within 'ul#peeps' do
      time = Time.now
      time = time.strftime("%H:%M:%S")
      expect(page).to have_content 'This is my first peep!'
      expect(page).to have_content time
    end
  end
end
