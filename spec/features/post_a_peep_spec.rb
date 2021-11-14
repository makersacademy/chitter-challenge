feature 'I can post apeep to chitter' do

  scenario 'User can post a peep to chitter' do
    visit('/') 
    fill_in 'peep_content', with: 'Hello Chitter users!'
    click_button 'Post'
    expect(page).to have_content 'Hello Chitter users!'
  end
end
