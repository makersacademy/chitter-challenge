feature 'Post a message' do
  scenario 'peep on chitter' do
    Peep.delete_all
    visit '/peep'
    fill_in 'new_peep', with: 'my first peep'
    click_button 'Post_Peep'
    expect(page).to have_content 'my first peep'
  end
  scenario 'peep again' do
    visit '/peep'
    fill_in 'new_peep', with: 'my second peep'
    click_button 'Post_Peep'
    expect(page).to have_content 'my first peep'
    expect(page).to have_content 'my second peep'
  end
end
feature 'See messages' do
  scenario 'displayed in reverse chronological order' do
    visit '/peep'
    index_of_first_peep = page.body.index('my first peep')
    index_of_second_peep = page.body.index('my second peep')
    expect(index_of_second_peep).to be < index_of_first_peep
  end
  scenario 'with time peep was made displayed' do
    time = Time.now()
    Timecop.freeze(time)
    visit '/peep'
    fill_in 'new_peep', with: 'my third peep'
    click_button 'Post_Peep'
    expect(page).to have_content(time.strftime('%F %T'))
  end
end
