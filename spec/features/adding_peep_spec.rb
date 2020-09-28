feature 'posting a peep' do 
  scenario 'user can post a peep to chitter' do 
    add_peeps_db
    
    visit('/')
    fill_in('add_peep', with: 'This is my first peep')
    click_on('post')
    expect(page).to have_content('This is my first peep')
  end 
end
