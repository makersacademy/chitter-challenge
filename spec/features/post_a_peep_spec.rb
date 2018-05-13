feature 'Post a peep' do

  scenario 'A user can post a peep' do
    register
    visit '/peeps'
    fill_in 'peep', with: 'My first peep'
    click_button 'Post'
    expect(page).to have_content 'My first peep'
    expect(page).to have_content 'Peeper: georgeyporgey'
  end

  scenario 'A user can see peeps in chronological order' do
    register
    visit '/peeps'
    fill_in 'peep', with: 'My first peep'
    click_button 'Post'
    sleep 1
    fill_in 'peep', with: 'My second peep'
    click_button 'Post'
    sleep 1
    fill_in 'peep', with: 'My third peep'
    click_button 'Post'
    expect('My third peep').to appear_before('My second peep')
    expect('My second peep').to appear_before('My first peep')
  end

  scenario 'Peep created time appears' do
    register
    visit '/peeps'
    fill_in 'peep', with: 'My first peep'
    time = Time.now
    click_button 'Post'
    expect(page).to have_content("#{format("%02d", time.hour)}:#{format("%02d", time.min)}" || "#{format("%02d", time.hour)}:#{format("%02d", time.min + 1)}")
  end

end
