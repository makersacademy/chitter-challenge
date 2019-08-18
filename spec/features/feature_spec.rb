

feature 'adding a post' do
    scenario 'loading new post page' do
    visit ('/')
    click_button 'New'
    expect(page).to have_content('Hello')
  end

    scenario 'adding post' do
    visit ('/mainpage/new')
    fill_in('msg', with: "test")
    click_button 'Submit'
    expect(page).to have_content('test')
  end
end


feature 'list all posts' do
    scenario 'display posts on mainpage' do
    visit ('/mainpage/new')
    fill_in('msg', with: "test")
      fill_in('timeadded', with: "test")
    click_button 'Submit'
    expect(page).to have_content('test')
  end
end
