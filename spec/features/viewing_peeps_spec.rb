feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "All chitter peeps"
  end
end

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    
    visit('/peeps')

    expect(page).to have_content "Whats up Chitter"
    expect(page).to have_content "What do you want to say?"
    expect(page).to have_content "I am hungry"
  end
end