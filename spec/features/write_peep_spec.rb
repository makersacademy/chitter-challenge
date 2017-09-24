feature 'can write and post peeps' do
  scenario 'user can post a peep and see it in the feed' do
    visit '/peeps'

    expect(page.status_code).to eq 200
    expect(page).not_to have_content 'This is a test peep'

    fill_in 'peep_text', with: 'This is a test peep'
    click_button 'Post!'

    within 'ul#peeps' do
      expect(page).to have_content('This is a test peep')
    end
  end

  scenario 'posts appear in reverse chronological order' do
    visit '/peeps'

    fill_in 'peep_text', with: 'First peep'
    click_button 'Post!'

    fill_in 'peep_text', with: 'Second peep'
    click_button 'Post!'

    expect(page.body.index('Second peep')).to be < page.body.index('First peep')
  end

  scenario 'peep stores post time' do
    visit '/peeps'

    fill_in 'peep_text', with: 'Time check peep'
    time = Time.now
    click_button 'Post!'

    expect(page.body).to have_content time.strftime("-Posted at %I:%M%p")
  end
end
