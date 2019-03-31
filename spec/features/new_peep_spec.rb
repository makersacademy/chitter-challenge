feature 'Writing a new peep' do
  scenario 'User can write a new peep' do
    visit('/peep/new')
    fill_in('new peep', with: 'This is a new peep')
    
    click_button('Submit')
    
    expect(page).to have_content 'This is a new peep'
  end
end