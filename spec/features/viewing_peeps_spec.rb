require './app/models/user'
require './app/models/peep'

feature 'Viewing peeps' do 


  scenario 'I can view peeps on the peep feed page' do
    Peep.create(message: 'hello')
    visit '/feed'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do 
      expect(page).to have_content('hello')
    end 
  end




end