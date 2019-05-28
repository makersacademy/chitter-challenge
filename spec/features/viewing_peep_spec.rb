feature 'Testing infrastructure' do 
    scenario 'A maker can decide to post a peep' do 
        visit('/chitter')

        expect(page).to have_button('Peep') 
    end 
end 

feature 'Write a peep' do 
    scenario 'A maker can write a peep' do 
        visit('/chitter')
        click_button('New Peep')
        
        expect(page).to have_content "What are you peeping?"
    end 
end 

feature 'Viewing peeps' do
    scenario 'A maker can see peeps' do
      Peep.create(name: 'Gary', message: 'I am at work')

      visit('/chitter')
  
      expect(page).to have_content ('Gary')
    end
end 
