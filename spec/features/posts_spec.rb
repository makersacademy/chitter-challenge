
feature 'Posts' do
  scenario 'I can add posts when I am logged in' do
    signup
    signin(username: "AppleMan", password: "apple123")
    visit '/posts/new'
    fill_in 'post', with: 'Hello, world!'
    click_button 'post it'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Hello, world!')
  end

  scenario 'I can see the list of posts which people submitted, when I am logged in or out' do
    signup
    signin(username: "AppleMan", password: "apple123")
    visit '/posts/new'
    fill_in 'post', with: 'Hello, world!'
    click_button 'post it'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Hello, world!')
    click_button 'sign out'
    expect(page).to have_content('Hello, world!')
  end
  
  scenario 'I can see a username along with each post' do
    signup
    signin(username: "AppleMan", password: "apple123")
    visit '/posts/new'
    fill_in 'post', with: 'This is cool!'
    click_button 'post it'
    expect(page.status_code).to eq 200
    expect(page).to have_content('AppleMan - This is cool!')
  end
end
