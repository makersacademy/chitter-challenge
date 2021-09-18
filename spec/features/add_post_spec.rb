feature 'add post' do
  scenario 'user is able to add post' do
    visit('/chitter/add')
    fill_in 'peep_text', with: 'This is a peep to test add functionality!'
    click_button 'Post'
    expect(page).to have_content 'This is a peep to test add functionality!'    
  end
end
