feature 'post peep' do
  scenario 'as a user able to post' do
    post_peep_to_chitter

    expect(page).to have_content 'First peep'
  end

  scenario 'able to delete peep' do
    post_peep_to_chitter
    click_button 'Delete Peep'

    expect(page).not_to have_content 'First Peep'
  end

end
