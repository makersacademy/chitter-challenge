feature 'Post a peep' do

  scenario 'A user can post a peep' do
    visit '/peeps'
    fill_in 'peep', with: 'My first peep'
    click_button 'Post'
    expect(page).to have_content 'My first peep'
  end

  scenario 'A user can see peeps in chronological order' do
    visit '/peeps'
    fill_in 'peep', with: 'My first peep'
    click_button 'Post'
    fill_in 'peep', with: 'My second peep'
    click_button 'Post'
    fill_in 'peep', with: 'My third peep'
    click_button 'Post'
    expect('My third peep').to appear_before('My second peep')
    expect('My second peep').to appear_before('My first peep')
  end

  scenario 'Peep created time appears' do
    visit '/peeps'
    fill_in 'peep', with: 'My first peep'
    time = Time.now
    click_button 'Post'
    expect(page).to have_content("#{time.hour}:#{time.min}" || "#{time.hour}:#{time.min +  1}")
  end

end
