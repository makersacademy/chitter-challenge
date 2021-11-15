feature 'Testing infrastructure' do
    scenario 'visiting the index page' do
      visit('/')
      expect(page).to have_content "Welcome to Chitter, You have signed up successfully!"
    end
  end

feature 'Viewing peeps' do 
  scenario 'A user can see peeps' do
    visit('/peeps')
    expect(page).to have_content('This is the first peep')
    expect(page).to have_content('This is the second peep')
    expect(page).to have_content('This is the third peep')
  end
end