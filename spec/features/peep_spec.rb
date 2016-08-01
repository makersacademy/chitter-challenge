feature 'Peep' do

  scenario 'Logged in user can post a message' do
    login
    post_peep
    expect(current_path).to eq '/'
    expect(page).to have_content 'Your Peep has been posted'
    expect(page).to have_content 'This is a test post, Hello World!'
  end

  context 'Order and content' do
    let(:user) { user = User.new(name: 'Mannie', username: 'mannieg',
                password: 'test', password_confirm: 'test',
                email: 'mannieg@googlemail.com')}
    before do
      user.save
    end

    scenario 'see all peeps in reverse chronological order' do
      Peep.create(:user => user, :message => 'Older peep', :created_at => DateTime.now - (5.0/24))
      Peep.create(:user => user, :message => 'Newer peep')
      visit '/'
      within ".list-group" do
        expect('Newer peep').to appear_before('Older peep')
      end
    end

    scenario 'shows timestamp of peep post' do
      time = DateTime.now
      Peep.create(:user => user, :message => 'Hello World!', :created_at => time)
      visit '/'
      expect(page).to have_content time.strftime('%c')
    end
  end

end
