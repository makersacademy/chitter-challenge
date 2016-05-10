feature 'Adding peeps' do 
  scenario 'User can create a new peep' do 
    visit '/peeps/new'
    fill_in 'peep', with: "I'm peeping!"
    click_button 'Peep!'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content("I'm peeping!")
    # expect(page).to have_content(Time.now.strftime("%H:%M:%S %d-%m-%Y"))
  end
end
