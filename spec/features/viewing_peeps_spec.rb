feature 'Testing the infrastructure of our app' do
  scenario 'Testing the user can see Welcome to Chitter on the homepage' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter!'
  end
end

feature 'User views all of their peeps' do
  scenario 'user can views their peeps' do
    connection = PG.connect(dbname: 'chitter_manager_test')

    Peep.create(username: 'makers', peep: 'Hello, Twitter!', created_at: "2020-07-05 22:42:07.921341")
    Peep.create(username: 'katie1995', peep: 'I love Makers!', created_at: "2020-07-05 22:42:07.921341")

    visit('/peeps')
    expect(page).to have_content('Hello, Twitter!')
  end
end
