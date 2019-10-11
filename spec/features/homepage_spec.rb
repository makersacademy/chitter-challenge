feature 'Viewing homepage' do

  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
    expect(page).to have_content "First peep"
    expect(page).to have_content "Second peep"
    expect(page).to have_content "Third peep"
  end
  
end
