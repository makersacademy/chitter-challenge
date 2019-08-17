

feature 'adding a post' do
    scenario 'adding post' do

    visit ('/mainpage/new')
    fill_in('msg', with: "http://www.test.com")
    click_button 'Submit'
    expect(page).to have_content('test')
  end
end
