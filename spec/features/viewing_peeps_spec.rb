feature 'Viewing Peeps' do
  xscenario 'I can see existing peeps on the peeps page' do
    Peep.create(peep_content: 'Makers Academy is going well')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
