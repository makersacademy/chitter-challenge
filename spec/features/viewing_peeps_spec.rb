feature 'Viewing peeps' do
  scenario 'user can view list of peeps' do
    Peep.create('Zsofi', 'Test')
    visit '/peeps'
    expect(page).to have_content('Test')
  end
end
