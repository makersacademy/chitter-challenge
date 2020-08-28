feature 'View cheeps' do 
  scenario 'visit the index page' do
    visit('/')
    expect(page).tp have_content 'Chitter'
  end
end