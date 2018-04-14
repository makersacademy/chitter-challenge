feature 'Should be able to post a peep to chitter' do

  scenario 'fill out post peep form and see peep on homepage' do
    visit('/')
    fill_in('peep', :with => 'my first peep!' )
    click_button 'Post'
    visit('/')
    expect(page).to have_content 'my first peep!'
  end

  scenario 'peeps appear in reverse chronological order' do
    visit('/')
    fill_in('peep', :with => 'my first peep!' )
    click_button 'Post'
    fill_in('peep', :with => 'my second peep!' )
    click_button 'Post'
    visit('/')
    expect('my second peep!').to appear_before('my first peep!')
  end

  scenario 'peeps appear with time they were posted' do
    visit('/')
    fill_in('peep', :with => 'my first peep!' )
    click_button 'Post'
    expect(page).to have_content (Time.now).strftime("%H:%M:%S")
  end

end
