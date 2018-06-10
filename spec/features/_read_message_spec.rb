feature 'read peeps' do
  scenario 'peeps are displayed in reverse chronological order' do

    visit '/'
    fill_in('peep', with: 'first_peep_test')
    click_button('peep')
    fill_in('peep', with: 'second_peep_test')
    click_button('peep')

    expect('first_peep_test').to_not appear_before('second_peep_test')

  end

  scenario 'messages have a time stamp' do
    some_peep = Peep.new(99, 'time_check', '2018-06-10 10:27:58.348763')

    visit '/'
    fill_in('peep', with: 'time_check')
    click_button('peep')

    expect(page).to have_content(some_peep.time)

  end

end
