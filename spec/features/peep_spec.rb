feature 'Peep' do
  scenario 'Logged in user can post a message' do
    login
    click_link 'Post Peep'
    fill_in 'peep', with: 'This is a test post, Hello World!'
    click_button 'Peep'
    expect(current_path).to eq '/'
    expect(page).to have_content 'Your Peep has been posted'
    expect(page).to have_content 'This is a test post, Hello World!'
  end

  scenario 'see all peeps in reverse chronological order' do
    user = User.new(name: 'Mannie', username: 'mannieg', password: 'test',
             password_confirm: 'test', email: 'mannieg@googlemail.com')
    user.save
    Peep.create(:user => user, :message => 'Older peep', :created_at => DateTime.now - (5.0/24))
    Peep.create(:user => user, :message => 'Newer peep')
    visit '/'
    within ".list-group" do
      expect('Newer peep').to appear_before('Older peep')
    end
  end
end
