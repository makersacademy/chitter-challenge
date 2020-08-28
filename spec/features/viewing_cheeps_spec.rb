feature 'View cheeps' do 
  scenario 'visit the index page' do
    visit('/')
    expect(page).to have_content 'Chitter'
  end
end