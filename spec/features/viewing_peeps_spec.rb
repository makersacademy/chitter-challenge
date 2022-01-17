feature 'Viewing peeps' do
  scenario 'shows a list of peeps' do
    Peep.create(message: "First peep")
    Peep.create(message: "Second peep")
    
    visit '/peeps'

    expect(page).to have_content 'First peep'
    expect(page).to have_content 'Second peep'
  end
end
