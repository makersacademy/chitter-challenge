feature 'editing peeps' do
  scenario 'peep has changed after editing' do
    sign_up_and_get_peeping

    click_button 'Peep'
    fill_in('peep', with: 'Building Chitter')
    click_button 'Post'

    click_button 'Peep'
    fill_in('peep', with: 'Writing tests')
    click_button 'Post'

    expect(page).to have_content 'Building Chitter'
    expect(page).to have_content 'Writing tests'

    click_button 'My Peeps'

    first('.peep').click_button 'Edit'

    fill_in('peep', with: 'Making lunch!')
    click_button 'Save'

    expect(page).not_to have_content 'Writing tests'
    expect(page).to have_content 'Making lunch!'

    click_button 'Back to Feed'

    expect(page).not_to have_content 'Writing tests'
    expect(page).to have_content 'Making lunch!'
    expect(current_path).to eq '/peeps'
  end
end
