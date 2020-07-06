feature 'Testing the infrastructure of our app' do
  scenario 'Testing the user can see Welcome to Chitter on the homepage' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter!'
  end
end

feature 'User views all of their peeps' do
  scenario 'user can views their peeps' do
    connection = PG.connect(dbname: 'chitter_manager_test')

    Peep.create(username: 'makers', peep: 'Hello, Twitter!', time_created: "09:05:17.169641")
    Peep.create(username: 'katie1995', peep: 'I love Makers!', time_created: "09:05:17.169641")

    visit('/peeps')
    expect(page).to have_content('Hello, Twitter!')
  end
end
