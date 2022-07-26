require 'pg'

feature 'Viewing peeps' do
  feature 'Seeing peeps' do
    scenario 'visiting the index page' do
       visit('/')

      expect(page).to have_content "Chitter"
    end
  end

  feature 'Seeing peeps' do
    scenario 'a user can see peeps' do
      Peeps.create(name: "This is my first peep")
      Peeps.create(name: "Hello Peeps!")
    
      visit '/peeps'

      expect(page).to have_content 'This is my first peep'
      expect(page).to have_content 'Hello Peeps!'
    end
  end
end
    
  

  
  