feature 'viewing peeps feed' do
  scenario 'shows a list of peeps in reverse date order' do
    
    visit '/peeps'

    expect(page).to have_content 'Peep #3'
    expect(page).to have_content 'Peep #2'
    expect(page).to have_content 'Peep #1'
  end
end
