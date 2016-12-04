feature 'Viewing peeps' do

  scenario 'anyone can see the peeps' do
    content = "Test content. Test content. Test content."
    peep_time = Time.now
    Peep.create(content: content, time: peep_time)
    visit '/peeps'
    expect(page).to have_content(content)
    expect(page).to have_content(peep_time)
  end
end
