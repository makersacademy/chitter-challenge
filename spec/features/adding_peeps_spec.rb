feature 'Add peep' do
  scenario 'user can add a peep' do
    visit('/')
    click_button 'Add Peep'
    fill_in 'peep', :with => 'Good evening!'
    click_button 'Submit'
    expect(page).to have_content 'Good evening!'
  end
end
