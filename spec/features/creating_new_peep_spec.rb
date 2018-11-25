feature 'post new peep' do
  scenario 'user can post a new peep' do
    visit '/'
    fill_in('body', with: 'test peep')
    click_button('Post new peep')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'test peep'
  end

  scenario 'user can see when peeps were posted' do
    Timecop.freeze(2018,11,25,10,0,0)
    visit '/'
    fill_in('body', with: 'test peep')
    click_button('Post new peep')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'test peep'
    expect(page).to have_content '10:00:00, Sunday 25 November 2018'
  end
end
