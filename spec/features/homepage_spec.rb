feature 'Testing infrastructure' do
  scenario 'Homepage contains text' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end

  scenario 'Homepage has a button to view list of peeps' do
    visit '/'
    expect(page).to have_button 'View Peeps'
  end
end
