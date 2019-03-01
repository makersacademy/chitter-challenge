feature 'Post a Peep' do
  scenario 'Visit the home page and see Welcome message' do
    visit ('/')
    expect(page).to have_content "Welcome to Chitter!!!"
  
  
  
  end


end