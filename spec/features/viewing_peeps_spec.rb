feature 'Viewing peeps' do
  scenario 'visiting the front page' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter!'
  end

  scenario 'peeps are shown in reverse time order' do
    visit '/'
    fill_in 'text', with: 'Test peep 1'
    click_button 'Say Something'
    fill_in 'text', with: 'Test peep 2'
    click_button 'Say Something'
    fill_in 'text', with: 'Test peep 3'
    click_button 'Say Something'

    expect(page.body) =~ /Test peep 3.*Test peep 2.*Test peep 1/
  end
end
