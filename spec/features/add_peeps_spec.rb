feature 'can add peeps' do
  scenario 'add a simple anonymous peep' do
    visit '/peeps/new'
    fill_in 'text', with: 'Because I have nothing better to talk about'
    click_button 'Peep'
    expect(page).to have_content 'nothing' 
  end 
end 

