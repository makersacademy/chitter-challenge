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
    time = Time.now.strftime('%H:%M')

    expect(page).to have_text "First peep\n#{time}\nSecond Peep\n#{time}"
  end

  scenario 'bale to see peeps in reverse' do
    post_peep_to_chitter
    fill_in 'peep', with: 'Second Peep'
    click_button 'Post Peep'
    page.select 'Sort Peeps Descending', from: 'peep_sort'
    click_button 'Sort Peeps'
    time = Time.now.strftime('%H:%M')

    expect(page).to have_text "Second Peep\n#{time}\nFirst peep\n#{time}"
  end

  scenario 'able to see time the peep been posted' do
    post_peep_to_chitter
    time = Time.now.strftime('%H:%M')

    expect(page).to have_text "First peep\n#{time}"
  end

end
