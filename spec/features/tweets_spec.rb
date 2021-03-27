feature '/home' do 
  scenario 'you get greeted by a list of tweets' do 
    visit '/home' 
    expect(page).to have_content "my first tweet"
  end 

  scenario 'you can add a tweet' do 
    visit '/home' 
    expect(page).to have_button 'Tweet'
  end

  scenario 'you can write a new tweet and see it returned after posting' do 
    visit '/home' 
    fill_in 'new_tweet', with: 'test tweet'
    click_on 'Tweet'
    expect(page).to have_content 'test tweet'
  end 
end 