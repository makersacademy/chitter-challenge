feature 'create new post' do 
  scenario 'Has a Peep Post box / creates new peep' do 
    visit('/chitter')
    click_button('new_post')
    fill_in('peep', with: 'This is a new peep test')
    click_button('post')

    expect(page).to have_content('Welcome to Chitter')
    expect(page).to have_content('This is a new peep test')
  end 
end 
