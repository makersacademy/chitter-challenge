feature 'view the peeps' do
  scenario 'view all the peeps content and date on the page' do
    visit '/peeps'
    expect(page).to have_content "Happy Sunday!"
  end
end