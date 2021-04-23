feature 'Viewing the homepage' do
  scenario 'Loading Index' do 
    visit('/')
    expect(page).to have_content 'Hello and welcome to Chitty Chitty Bang Bang'
  end
end