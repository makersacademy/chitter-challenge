feature 'Post a peep with a time signiture' do
  scenario 'will post time when a peep was posted' do
    visit('/peeps/post')
    fill_in 'title', with: 'Hi'
    fill_in 'content', with: 'Hi, my name is Mr Peeps'
    click_button 'Post peep'
    within 'ul#peeps' do
      expect(page).to have_content(Time.now.strftime("%Y-%m-%e %H:%M"))
    end
  end
end
