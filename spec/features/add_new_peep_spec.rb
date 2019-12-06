feature 'Add peeps' do
  scenario 'Should add a new peep to the database and show it on the list of peeps' do
    visit('/')
    click_on 'Post a peep'
    fill_in 'username', with: 'EllieM'
    fill_in 'content', with: 'This is my peep!'
    click_on 'Post'
    expect(page).to have_content 'EllieM'
    expect(page).to have_content 'This is my peep!'
  end 
end
