feature 'View Peeps' do
  scenario 'User can view all peeps' do
    sign_up
    post_peep
    visit '/'
    click_button 'View Peeps'
    expect(page).to have_content 'My first peep'
  end

  scenario 'User can see the time the peep was posted' do
    visit '/'
    click_button 'View Peeps'
    page.find('#time', :visible => true)
  end

  scenario 'Peeps show username of user who posted it' do
    sign_up
    post_peep
    visit '/'
    click_button 'View Peeps'
    expect(page).to have_content "username1"
  end

  scenario 'Peeps are shown in reverse chronological order' do
    sign_up
    post_peep('Newest Peep')
    visit '/'
    click_button 'View Peeps'
    expect(first('#peep-text')).to have_content 'Newest Peep'
  end
end
