feature 'user can post a peep' do
  scenario 'web site test' do
    visit('/')
    expect(page).to have_content('Chitter')
  end
  
end