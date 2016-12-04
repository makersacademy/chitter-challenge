RSpec.feature 'post peeps'  do
  scenario 'we want to be able to post peeps' do
    sign_up
    sign_in
    visit('/peeps/new')
    fill_in 'peep', :with => 'I hate chitter!'
    click_button 'Post'
    expect(page).to have_content "I hate chitter!"
  end

  scenario 'we want peeps to be in reverse order' do
    sign_up
    sign_in
    visit('/peeps/new')
    fill_in 'peep', :with => 'I hate chitter!'
    click_button 'Post'
    visit('/peeps/new')
    fill_in 'peep', :with => 'I hate EVERYTHING!'
    click_button 'Post'
    expect(page).to have_content "I hate EVERYTHING!"
    expect(page).to have_content "I hate chitter!"
  end

  scenario 'we want to see the time a peep is posted' do
    sign_up
    sign_in
    visit('/peeps/new')
    fill_in 'peep', :with => 'I hate chitter!'
    click_button 'Post'
    time = Time.now
    expect(page).to have_content("posted at: #{time.strftime('%d/%m/%Y %I:%M%p')}")
  end

end
