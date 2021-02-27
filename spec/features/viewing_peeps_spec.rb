feature 'viewing peeps' do
  scenario 'peeps visible when not logged in' do
    User.create(name: 'test1', email: 'test1@test.com',
      username: 'testname1', password: 'Test111')

    Peep.create(content: 'Building Chitter', user_id: 1)
    Peep.create(content: 'Taking a break', user_id: 1)
    Peep.create(content: 'Writing tests', user_id: 1)

    visit '/peeps'

    expect(page).to have_content 'Building Chitter'
    expect(page).to have_content 'Taking a break'
    expect(page).to have_content 'Writing tests'
  end

  scenario 'peeps appear in reverse chronological order' do
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
