feature 'Create Peep' do
  scenario 'a user can create a peep' do 
    visit '/'

    fill_in(:message, with: "THE BEST PEEP EVER!")
    fill_in(:username, with: "Peepz4Dayz")
    click_button 'Peep It!'

    expect(page).to have_content "THE BEST PEEP EVER! -Peepz4Dayz"
  end
end