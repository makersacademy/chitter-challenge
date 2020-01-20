feature "Viewing messages" do
  scenario "viewing messages" do
    Message.create(content: "Hello people", time: Time.new, author: "Marcellofabbri")
    Message.create(content: "Nice day", time: Time.new, author: "Marcellofabbri")
    visit '/messages'
    # expect row number two to be the oldest message posted
    # expect row number one to be the latest message posted
    expect(page.find('li:nth-child(2)')).to have_content "Hello people"
    expect(page.find('li:nth-child(1)')).to have_content "Nice day"
  end

  scenario "messages have dates" do
    time = DateTime.new(2020,01,18,17,00,00,"00:00")
    Message.create(content: "This message right now", time: time, author: "Marcellofabbri")
    visit '/messages'
    expect(page).to have_content "Posted on 2020-01-18 17:00:00"
  end
  
end