feature 'viewing chitter homepage' do
  scenario 'visiting index page' do 
    visit('/chitter')
    expect(page).to have_content "Welcome to Chitter"
  end
end
