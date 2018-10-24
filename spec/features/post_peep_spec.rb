feature 'post peep' do
  scenario 'user can post a peep to chiiter' do
    visit ('/chitter')
    fill_in(:peep, with: 'My first peep')
    click_button('Post')
    expect(page).to have_content 'My first peep'
  end
end 
