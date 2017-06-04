feature 'Viewing chits' do
  scenario 'I can see peeps on a page' do
    user = User.create(email: 'hi', password: 'hi')
    Peep.create(content: "Hello World", user_id: user.id)
    visit '/peeps'
    expect(page.status_code).to eq 200
    expect(page).to have_content("Hello World")
  end

  scenario 'I can see the time the peep was created' do
    user = User.create(email: 'hi', password: 'hi')
    Peep.create(content: "Hello World", time: Time.new, user_id: user.id)
    visit '/peeps'
    expect(page).to have_content("Content: Hello World Time: #{Time.new}")
  end

  scenario 'I can see peeps in descending order of time' do
    user = User.create(email: 'hi', password: 'hi')
    Peep.create(content: "Hello World", time: 3, user_id: user.id)
    Peep.create(content: "Hello World2", time: 4, user_id: user.id)
    visit '/peeps'
    expect(page).to have_content("Hello World2 Time: 4 By: hi Content: Hello World Time: 3 By: hi")
  end

  scenario 'I can see the author of the peeps' do
    visit '/signup'
    signup
    peep
    expect(page).to have_content("By: fake@fake.com")
  end
end
