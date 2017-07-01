feature 'Posting a Peep' do
  scenario 'Posts a peep successfully' do
    post_peep("Test message")
    expect(page.status_code).to be 200
  end
end

xfeature 'Viewing Peeps' do
  scenario 'Peep shows on the page' do
    post_peep("A test peep ha ha #sick")
    expect(page).to have_content 'A test peep ha ha #sick'
  end

  scenario 'Peeps display in reverse chronological order' do
    post_peep("First peep")
    post_peep("Second peep")
    post_peep("Third peep")
    expect("Third peep").to appear_before("Second peep")
  end

  scenario 'Peeps have a timestamp' do
    post_peep("Test message")
    expect(find("span.timestamp").text).to match(/(\d{1,2}):(\d{1,2}) (\d{1,2})-(\d{1,2})-(\d{4})/)
  end
end
