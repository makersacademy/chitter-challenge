feature 'Viewing peeps in reverse chronological' do

  scenario 'I can see existing peeps in reverse chronological' do
    Peep.create(peep: 'Hello World')
    Peep.create(peep: 'How are you?')

    visit '/peeps'
    within 'ul#peeps' do
    	expect(page.find('li:nth-child(1)')).to have_content 'How are you?'
      expect(page.find('li:nth-child(2)')).to have_content('Hello World')
    end
  end

end