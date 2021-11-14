feature 'Viewing peeps' do 
  scenario 'peeps are displayed on the page' do
    visit '/peeps'
    expect(page).to have_content('Peep #1')
    expect(page).to have_content('Peep #2')
  end
end
