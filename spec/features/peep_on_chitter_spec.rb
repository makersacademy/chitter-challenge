#As a Maker
#So that I can let people know what I am doing  
#I want to post a message (peep) to chitter

#As a maker
#So that I can see what others are saying  
#I want to see all peeps in reverse chronological order

feature 'Peep' do

  context 'After signup' do
    before(:each) { signup }

    scenario 'User can post a peep, which is then shown on page' do
      peep 'My first peep!'
      expect(page).to have_content 'My first peep!'
    end

    scenario 'User can post 2 peeps, which are shown in reverse order' do
      peep 'My first peep!'
      peep 'My second peep!'
     
      within('li:nth-child(1)') do
        expect(page).to have_content 'second'
      end

      within('li:nth-child(2)') do
        expect(page).to have_content 'first'
      end
    end

  end
end
