feature 'Viewing peeps' do

  scenario 'user can see peeps on the peeps page' do
    Peep.create(peep: 'Hello Makers Academy', timestamp: '2016-11-03 00:30:08 +0000')
    visit '/'
    within 'ul#peeps' do
      expect(page).to have_content('Hello Makers Academy')
      expect(page).to have_content('Thu Nov 3 00:30:08 2016')
    end
  end
end
