feature 'Posting peeps' do
  scenario 'user can post a peep' do
    visit '/peeps/new'
    fill_in 'content', with: 'blablabla!'
    click_button 'Post'
    expect(page).to have_content('blablabla!')
  end

  scenario 'user can see the time when the peep was created' do
    visit '/peeps/new'
    fill_in 'content', with: 'blablabla!'
    current_time = Time.now.strftime("%H:%M:%S %d/%m/%Y")
    click_button 'Post'
    expect(page).to have_content(current_time)
  end

end
