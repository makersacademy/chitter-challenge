feature 'posting peeps(aka messages)' do 
  scenario 'a user can post a new peep and see it on /peeps page' do 
    sign_up
    
    fill_in('peep', with: 'Hey, here is my test peep')
   
    click_button('Post my peep')
    
    expect(page).to have_current_path('/peeps')
    expect(page).to have_content('Hey, here is my test peep')
    expect(page).to have_content('kbooks3')
  end
end