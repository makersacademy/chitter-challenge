feature 'peeps appear in reverse chronological order' do
  scenario '3 peeps displayed by most recent first' do
    sign_up_and_get_peeping

    click_button 'Peep'
    fill_in('peep', with: 'Building Chitter')
    click_button 'Post'

    click_button 'Peep'
    fill_in('peep', with: 'Taking a break')
    click_button 'Post'

    click_button 'Peep'
    fill_in('peep', with: 'Writing tests')
    click_button 'Post'

    expect(first('.peep')).to have_content 'Writing tests'
    expect(all(:css, '.peep').last).to have_content 'Building Chitter'
    expect(page).to have_content 'Building Chitter'
    expect(all(:css, '.peep').count).to be 3
  end
end
