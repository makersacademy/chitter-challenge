#As a Maker
#So that I can let people know what I am doing  
#I want to post a message (peep) to chitter

feature 'Peep' do

  context 'After signup' do
    before(:each) { signup }

    scenario 'User can post a peep, which is then shown on page' do
      peep 'My first peep!'
      expect(page).to have_content'My first peep!'
    end

    scenario 'User can post 2 peeps, which are both shown on page' do
      peep 'My first peep!'
      peep 'My second peep!'
      expect(page).to have_content'My first peep!'
      expect(page).to have_content'My second peep!'
    end
  end
end
