feature 'Posting peeps' do
  scenario 'user can post a peep' do
    post_a_peep
    expect(page).to have_content('blablabla!')
  end

  scenario 'user can see the time when the peep was created' do
    post_a_peep
    current_time 
    expect(page).to have_content(current_time)
  end

end
