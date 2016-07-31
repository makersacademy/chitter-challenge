# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Post a peep' do
  before do
  User.create(name: 'Georgia',
              username: 'grmillsy',
              email: 'g@hotmail.com',
              password: '123',
              password_confirmation: '123')
  end
    xscenario 'I want to publish a post' do
      log_in(username: 'grmillsy', password: '123')
        visit '/posts/new'
        fill_in 'Title', with: 'Post'
        fill_in 'Post', with: 'This is a post'
        click_button 'publish post'
    expect(current_path).to eq '/posts'
    expect(page).to have_content 'This is a post'
  end
end
