feature 'A user can create a Peep' do
  scenario 'can create and display peep' do
    visit('/chitter')
    fill_in('new_peep', with: "Hey Makers")
    click_button('Peep')
    expect(page).to have_content("Hey Makers")


    
  end
  
end