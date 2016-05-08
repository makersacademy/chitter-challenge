feature 'posting a peep' do

  before(:each) do
    create_user_alice
    log_in(email: 'alice@example.com', password: 'orange')
  end

  scenario 'user can post a peep' do
    fill_in :content, with: 'Hello'
    click_button 'peep'
    expect(User.first.name).to eq 'Alice'
    expect(User.first(name: 'Alice').peeps.map(&:content)).to include 'Hello'
    within 'ul#peeps' do
      expect(page).to have_content 'Hello'
      expect(page).to have_content 'Alice'
      expect(page).to have_content 'Wonderland'
    end
  end

end