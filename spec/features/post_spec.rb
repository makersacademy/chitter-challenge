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

  scenario 'bale to post multiple peeps' do
    post_peep_to_chitter
    fill_in 'peep', with: 'Second Peep'
    click_button 'Post Peep'

    expect(page).to have_content "First peep\nSecond Peep"
  end

end
