require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can view peeps' do
    
    Peep.create(text: "Posting peeps is so much fun!")
    Peep.create(text: "Loving this new database stuff")

    visit('/peeps')
    
    expect(page).to have_content "Posting peeps is so much fun!"
    expect(page).to have_content "Loving this new database stuff"
  end
end