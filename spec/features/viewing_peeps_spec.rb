feature 'Viewing peeps' do
  scenario 'user can view list of peeps' do
    visit '/peeps'
    expect(page).to have_content('Good morning all!')
    expect(page).to have_content('Summer is here')
  end
end
