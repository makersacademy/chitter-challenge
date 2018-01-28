feature 'Posting peeps' do
  scenario 'I want to post a message (peep) to chitter' do
    sign_up
    sign_in(email: 'someone@emailaddress.com', password: 'password')
    visit '/peeps/new'
    fill_in :peep, with: 'Hello world!'
    click_button 'Post'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('Hello world!')
    end
  end

  scenario 'I must be logged in to peep!' do
    visit '/peeps/new'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Must be logged in for that'
  end
end
