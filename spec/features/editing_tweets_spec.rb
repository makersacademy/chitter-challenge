feature 'editing peeps' do
  xscenario 'peep has changed after editing' do
    sign_up_and_get_peeping

    click_button 'Peep'
    fill_in('peep', with: 'Building Chitter')
    click_button 'Post'

    expect(page).to have_content 'Building Chitter'

    click_button 'Edit'

    fill_in('peep', with: 'Making lunch!')
    click_button 'Post'

    expect(current_path).to eq '/peeps'
    expect(page).not_to have_content 'Building Chitter'
    expect(page).to have_content 'Making lunch!'
  end
end
