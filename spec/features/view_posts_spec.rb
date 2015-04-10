feature 'User can view posts' do 

  before(:each) do
    Post.create(username: 'Caron',
               post: 'Hello there Chitterers')
  end

  scenario 'when opening homepage' do
    visit '/'
    expect(page).to have_content('Hello there Chitterers')
  end
end
