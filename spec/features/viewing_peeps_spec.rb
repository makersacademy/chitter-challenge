feature 'Viewing peeps' do
  scenario 'viewing a list of peeps' do
    visit '/'
    click_button 'View Peeps'
    visit '/peeps'
    expect(page).to have_content "Peep 1"
    expect(page).to have_content "Peep 2"
  end
end
