feature 'Homepage loads with peeps' do
  
  scenario 'home has peeps' do
    visit '/add'
    fill_in 'message', with: 'This is the first Peep!'
    click_button 'Peep'
    expect(current_path).to eq '/home'
    expect(page).to have_content 'This is the first Peep!'
  end

end