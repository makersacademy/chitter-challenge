feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    post_dummy_content
    visit('/peeps')
    expect(page).to have_content "Being methodical and sensible"
    expect(page).to have_content "I stick to the pomodoro technique"
    expect(page).to have_content "To get much done in little time"
  end

  scenario 'A user can add a new peep' do
    visit('/peeps')
    fill_in('peep', with: 'A new peep added by the user')
    click_on('Submit')
    expect(page).to have_content "A new peep added by the user"
  end

  scenario 'Peeps are shown in reverse chronological order' do
    post_dummy_content
    visit('/peeps')
    page.body.index('Being methodical and sensible').should < page.body.index('I stick to the pomodoro technique')
    page.body.index('I stick to the pomodoro technique').should < page.body.index('To get much done in little time')
  end

  scenario 'The time at which a peep was posted is shown' do
    post_dummy_content
    visit('/peeps')
    time = Time.now.strftime("%D at %H:%M:%S")
    expect(page).to have_content(time)
  end
end
