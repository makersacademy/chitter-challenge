feature 'Post Message' do 
  scenario 'User can post a message' do
    visit '/'
    expect(page).to have_content('Chitter')
    click_button 'Enter'
  end

end
