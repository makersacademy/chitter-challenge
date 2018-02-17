feature 'post a cheet to cheeter' do
  scenario 'On cheet homepage, post a cheet' do
    visit '/cheets'
    fill_in('title', with: 'My cheet')
    fill_in('body', with: 'Body of text')
    click_button 'Post Cheet'
    expect(page).to have_content 'My cheet'
    expect(page).to have_content 'Body of text'
  end
end
