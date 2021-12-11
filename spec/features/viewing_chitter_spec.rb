require 'pg'

feature 'Viewing the chitter page' do 
  scenario 'user able to visit the chitter main page' do
    visit ('/chitter') 
    expect(page).to have_content "Chitter"
  end
end

feature 'Viewing chitter posts' do
  scenario 'user can see all chitter posts' do
    connection = PG.connect(dbname: 'chitter_app_test')
    testuser = User.create(name: 'test', email: 'test@example.com', password: 'password123')

    Chitter.create(post: "test post 1", author_id: testuser.id , author_email: testuser.email , author_name: testuser.name)
    Chitter.create(post: "test post 2", author_id: testuser.id , author_email: testuser.email , author_name: testuser.name)
    Chitter.create(post: "test post 3", author_id: testuser.id , author_email: testuser.email , author_name: testuser.name)
  
    visit('/chitter')

    expect(page).to have_content "test post 1"
    expect(page).to have_content "test post 2"
    expect(page).to have_content "test post 3"
  end
end
