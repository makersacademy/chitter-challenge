
feature 'Posts' do
  scenario 'I can add posts when I am logged in' do
    signup
    click_button 'sign out'
    signin(username: "AppleMan", password: "apple123")
    posting
    expect(page.status_code).to eq 200
    expect(page).to have_content('Hello, world!')
  end
  
  scenario 'I can not add posts when I am not logged in' do
    signup
    click_button 'sign out'
    visit '/posts/new'
    expect(page.status_code).to eq 200
    expect(page).not_to have_content('New Posts')
  end

  scenario 'I can see all the posts in reverse chronological order, whether I am logged in or out' do
    signup
    click_button 'sign out'
    signin(username: "AppleMan", password: "apple123")
    posting(post: 'first post')
    posting(post: 'second post')
    posting(post: 'third post')
    expect(page.status_code).to eq 200
    expect(find('ul li:nth-child(1)').text).to eq "AppleMan #{Time.now.strftime('%H:%M (%d-%b-%Y)')} - third post"
    expect(find('ul li:nth-child(2)').text).to eq "AppleMan #{Time.now.strftime('%H:%M (%d-%b-%Y)')} - second post"
    expect(find('ul li:nth-child(3)').text).to eq "AppleMan #{Time.now.strftime('%H:%M (%d-%b-%Y)')} - first post"
    click_button 'sign out'
    expect(find('ul li:nth-child(1)').text).to eq "AppleMan #{Time.now.strftime('%H:%M (%d-%b-%Y)')} - third post"
    expect(find('ul li:nth-child(2)').text).to eq "AppleMan #{Time.now.strftime('%H:%M (%d-%b-%Y)')} - second post"
    expect(find('ul li:nth-child(3)').text).to eq "AppleMan #{Time.now.strftime('%H:%M (%d-%b-%Y)')} - first post"
  end

  scenario 'I can see a username and time along with each post' do
    signup
    click_button 'sign out'
    signin(username: "AppleMan", password: "apple123")
    posting(post: 'This is cool!')
    expect(page.status_code).to eq 200
    expect(page).to have_content("AppleMan #{Time.now.strftime('%H:%M (%d-%b-%Y)')} - This is cool!")
  end
end
