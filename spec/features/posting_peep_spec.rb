feature 'post peep' do
  it 'adds a new (peep) message to the board' do
    visit '/homepage'
    click_button 'New Post'

    fill_in 'content', with: 'This is a test post'
    click_button 'Submit'

    expect(page).to have_content('This is a test post')
  end
end
