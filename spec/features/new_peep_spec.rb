feature 'Creates a peep' do
  scenario 'maker can enter a peep and see it' do
    sign_in
    visit '/peeps'
    fill_in 'peep', with: 'what I am thinking'
    click_button 'peep!'
    expect(page).to have_content 'what I am thinking'
  end 
end
