feature 'I want to be able to post a peep' do

  scenario 'I can post a peep' do
    signup
    login
    click_link('Peep')
    expect(current_path).to eq('/session/peep')

    fill_in('content', with:'Hello world, this is my first peep!')
    click_button('Post peep')
    expect(current_path).to eq('/session')
    expect(page).to have_content('Hello world')
  end

  scenario 'I can only post a peep if I am logged in' do
    signup
    click_link('Logout')
    click_link('Peep')
    expect(current_path).to eq('/session/new')
  end
end
