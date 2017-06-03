feature 'Viewing chits' do
  scenario 'I can see peeps on a page' do
    Peep.create(content: "Hello World")
    visit '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content("Hello World")
  end

  scenario 'I can see the time the peep was created' do
    Peep.create(content: "Hello World", time: Time.new )
    visit '/'
    expect(page).to have_content("Content: Hello World Time: #{Time.new}")
  end

  scenario 'I can see peeps in descending order of time' do
    Peep.create(content: "Hello World", time: 3 )
    Peep.create(content: "Hello World2", time: 4)
    visit '/'
    expect(page).to have_content("Hello World2 Time: 4 Content: Hello World Time: 3")
  end
end
