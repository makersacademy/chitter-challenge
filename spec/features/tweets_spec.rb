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

  scenario 'you can also delete the super awkward tweets that you posted years back and now make you want to barf' do 
    visit '/home'
    first('.tweet').click_on 'delete'
    visit '/home'
    expect(page).not_to have_content 'my first tweet'
  end 

  scenario 'people should know that awkward tweet was from a while back, through a time stamp' do 
    visit '/home'
    expect(page).to have_content '2021-03-27'
  end 
end 