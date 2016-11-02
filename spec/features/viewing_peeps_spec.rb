feature 'Viewing peeps' do

  scenario 'user can see peeps on the peeps page' do
    Peep.create(peep: 'Hello Makers Academy')
    visit '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('Hello Makers Academy')
    end
  end
end
