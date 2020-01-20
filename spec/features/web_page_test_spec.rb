
feature 'Home page' do
  scenario 'check home page opens and holds Chitter text' do 
    visit('/')
    expect(page).to have_content 'Chitter'
  end 
end 