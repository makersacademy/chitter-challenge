feature 'post message' do
  scenario 'posts a peep on the homepage' do
    
    visit '/peep'
    fill_in('name', with: 'The Shoveler')
    fill_in('peep', with: 'Peep peep')
    click_button 'Submit'

    expect(page).to have_content "The Shoveler says: Peep peep"
  end
end