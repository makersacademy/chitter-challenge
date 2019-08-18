

feature 'adding a post' do
    scenario 'loading new post page' do
    visit ('/')
    click_button 'New'
    expect(page).to have_content('Submit')
  end

    scenario 'adding post' do
    visit ('/')
    click_button 'New'
    fill_in('msg', with: "test")
    click_button 'Submit'
    expect(page).to have_content('test')
  end
end

feature 'list all posts' do
    scenario 'display posts on mainpage' do
    visit ('/new')
    fill_in('msg', with: "test")
    click_button 'Submit'
    expect(page).to have_content('test')
  end
end
