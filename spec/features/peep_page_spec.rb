# GET /chitter >> shows peeps / button to write new peep 

feature 'Main Chitter Page' do 
  scenario 'Main page shows multiple Peep posts' do 
    visit('/chitter')

    expect(page).to have_content('This is a test peep')
    expect(page).to have_content('This is a second test')
    expect(page).to have_content('This is a third test')
  end 
end 


















=begin 
  scenario 'Has a Peep Post box' do 
    visit('/chitter')
    fill_in('peep', with: 'This is a test peep')
    click_button('post')

    expect(page).to have_content('Welcome to Chitter')
    expect(page).to have_content('This is a new peep test')
  end 
=end 