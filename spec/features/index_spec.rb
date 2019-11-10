feature 'index page' do
  scenario 'posts peep' do
    visit '/'
    fill_in 'peep', with: 'test'
    click_button 'submit'
    expect(page).to have_content 'Peeps:' && 'test'
  end

  scenario 'shows multiple peeps' do
    visit '/'
    fill_in 'peep', with: '1st test'
    click_button 'submit'
    fill_in 'peep', with: '2nd test'
    click_button 'submit'
    expect(page).to have_content 'Peeps:' && '2nd test' && '1st test'
  end

  scenario 'shows timestamp' do
    visit '/'
    fill_in 'peep', with: '1st test'
    click_button 'submit'
    fill_in 'peep', with: '2nd test'
    click_button 'submit'
    expect(page).to have_content '2nd test' && '1st test' && 'posted at:'
  end
end
