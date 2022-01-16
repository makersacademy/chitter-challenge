feature 'Viewing peeps' do
  scenario 'peeps appear in reverse chronological order' do
    first_peep = Peep.add(content: 'First peep!')
    second_peep = Peep.add(content: 'Second peep!')
    third_peep = Peep.add(content: 'Third peep!')
    visit '/'

    peeps = page.all('.peep')
   
    expect(peeps[0]).to have_content "Third peep!"
    expect(peeps[1]).to have_content "Second peep!"
    expect(peeps[2]).to have_content "First peep!"
  end
  
  #Should I be stubbing time values to see whether?

  scenario 'user can see when a peep was created' do
    first_peep = Peep.add(content: 'First peep!')
    second_peep = Peep.add(content: 'Second peep!')
    third_peep = Peep.add(content: 'Third peep!')
    visit '/'

    time_tags = page.all('.time_tag')

    expect(time_tags[0]).to have_content "Peeped at #{third_peep.friendly_time}"
    expect(time_tags[1]).to have_content "Peeped at #{second_peep.friendly_time}"
    expect(time_tags[2]).to have_content "Peeped at #{first_peep.friendly_time}"
  end
end
