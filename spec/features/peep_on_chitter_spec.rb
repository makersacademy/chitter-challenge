#As a Maker
#So that I can let people know what I am doing  
#I want to post a message (peep) to chitter

#As a maker
#So that I can see what others are saying  
#I want to see all peeps in reverse chronological order

#As a maker
#So that I can better appreciate the context of a peep
#I want to see the time at which it was made

feature 'Peep' do

  context 'After signup' do
    before(:each) { signup }

    scenario 'User posts a peep, which is then shown on page' do
      peep 'My first peep!'
      expect(page).to have_content 'My first peep!'
    end

    scenario 'User posts 2 peeps, which are shown in reverse order' do
      peep 'My first peep!'
      peep 'My second peep!'
     
      expect('second').to appear_before('first')
    end

    scenario 'User posts a peep, which is then shown on page with time info' do
      time_now = Time.now.strftime('%A, %e %B at %k:%M')
      peep 'My first peep!'
      expect(page).to have_content time_now
    end

  end
end
