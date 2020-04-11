feature 'View Peeps' do
  scenario 'list of peeps on homepage' do
    # add test data
    Peep.create(content: 'This is so cool')
    Peep.create(content: 'I am sending a peep')
    Peep.create(content: 'Isolation #COVID-19')

    visit '/'
    expect(page).to have_content 'This is so cool'
    expect(page).to have_content 'I am sending a peep'
    expect(page).to have_content 'Isolation #COVID-19'
  end

  scenario 'list of peeps should start with the newest first' do
    # add test data
    Peep.create(content: 'This is so cool')
    Peep.create(content: 'I am sending a peep')
    Peep.create(content: 'Isolation #COVID-19')

    visit '/'
    expect(first('.peep')).to have_content 'Isolation #COVID-19'
  end

  scenario 'peeps should be labeled with the time they were peeped' do
    # add test data
    Peep.create(content: 'This is so cool')

    time_now = Time.now
    time_now_pretty = time_now.strftime('%b %e %I:%M%P')

    visit '/'
    expect(first('.peep')).to have_content time_now_pretty
  end

end
