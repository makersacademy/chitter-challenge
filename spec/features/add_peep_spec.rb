feature 'posting peeps(aka messages)' do 
  scenario 'a user can post a new peep and see it on /peeps page' do 
    visit '/peeps/new'
    fill_in('peep', with: 'Hey, here is my test peep')
    fill_in('user', with: 'kbrooks')
    fill_in('handle', with: 'testhandle')
    click_button('Post my peep')
    
    expect(page).to have_content('Hey, here is my test peep')
  end
end