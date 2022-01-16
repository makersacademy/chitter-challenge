feature 'Viewing peeps' do
  scenario 'shows a list of peeps' do
    Peep.create(user_name: "Alister", message: "First peep")
    Peep.create(user_name: "Oliver", message: "Second peep")
    
    visit '/peeps'

    expect(page).to have_content 'First peep'
    expect(page).to have_content 'Second peep'
  end
end
