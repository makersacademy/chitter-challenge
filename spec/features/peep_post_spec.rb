feature 'Post peep' do
  before(:each) do
    User.create(name: 'user',
                username: 'userfoo',
                email: 'user@example.com',
                password: 'foobar',
                password_confirmation: 'foobar')
  end

  scenario 'Can post a peep' do
    sign_in(username: 'userfoo', password: 'foobar')
    fill_in :peep, with: 'This is a test peep!'
    click_button 'post'
    expect(current_path).to eq('/peeps')
    # within 'ul#peep' do
        expect(page).to have_content('This is a test peep!')
      # end
  end
end
