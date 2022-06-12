feature 'Viewing peeps' do
  
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter Chatter"
  end

  scenario 'A user can see peeps' do
    visit('/peeps')
    expect(page).to have_content "This is my first peep"
    expect(page).to have_content "This is my second peep"
    expect(page).to have_content "This is my third peep"
  end
end




