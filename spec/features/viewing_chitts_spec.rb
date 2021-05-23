feature 'Viewing chitts' do 
  scenario 'A user can see cheets' do
    visit '/chitts'

    expect(page).to have_content "Hello Chitter Worlds!"
    expect(page).to have_content "The weather is great!"
    expect(page).to have_content "Time for an ice cream!" 
  end    
end