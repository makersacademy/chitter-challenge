feature 'User browses the list of posts' do

  before(:each) do
    Post.create(peep: 'blah blah blah', user: 'paulwallis42')
  end

  scenario 'when opening the home page' do
    visit '/'
    expect(page).to have_content('blah blah blah')
  end
end
