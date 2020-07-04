feature 'Viewing peeps' do
  scenario 'viewing a list of peeps' do
    visit '/'
    click_button 'View Peeps'
    visit '/peeps'
    expect(page).to have_content "First Peep"
    expect(page).to have_content "Second Peep"
  end
end
