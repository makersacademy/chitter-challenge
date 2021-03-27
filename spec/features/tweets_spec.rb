feature '/home' do 
  scenario 'you get greeted by a list of tweets' do 
    visit '/home' 
    expect(page).to have_content '["my first tweet"]'
  end 

  scenario 'you can add a tweet' do 
    visit '/home' 
    expect(page). to have_button 'Add tweet'
  end
end 