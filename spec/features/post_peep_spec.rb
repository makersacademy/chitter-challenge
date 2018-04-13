feature 'Should be able to post a peep to chitter' do
  scenario 'fill out post peep form and see peep on homepage' do
    visit('/')
    fill_in('peep', :with => 'my first peep!' )
    click_button 'Post'
    visit('/')
    expect(page).to have_content 'my first peep!' 
  end
end
