feature 'reverse timeline' do
  scenario 'displays timeline in reverse' do
    visit '/peep'
    fill_in('name', with: 'The Shoveler')
    fill_in('peep', with: 'Peep peep')
    click_button 'Submit'
    
    visit '/peep'
    fill_in('name', with: 'The Second Shoveler')
    fill_in('peep', with: 'Peep peep')
    click_button 'Submit'

    expect('The Second Shoveler').to appear_before('The Shoveler')
  end
end