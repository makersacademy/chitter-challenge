feature 'Viewing Peeps' do

  scenario 'I can see peeps on the peeps page' do
    Peep.create(message: 'profound observations')
    visit '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('profound observations')
    end
  end

  scenario 'I want to see the time a peep was made' do
    Timecop.freeze(Time.parse("2017-07-02 19:53:35 +0100"))
    Peep.create(message: 'sup')
    visit '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content("2017-07-02T19:53:35+01:00")
    end
  end
end
