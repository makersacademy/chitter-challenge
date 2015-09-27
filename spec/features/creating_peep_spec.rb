require './spec/factories/user'
require './spec/factories/peep'

feature 'creating peep' do
  scenario 'can only create peep when logged in' do
    visit '/peep/new'
    expect(page).to have_content 'Please log in to create peep.'
  end

  scenario 'can create a new peep' do
    user = create :user
    visit 'session/new'
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    click_button 'Log in'
    peep = build :peep
    visit '/peep/new'
    fill_in 'content', with: peep.content
    click_button 'Post'
    expect(current_path).to eq('/peep/all')
    expect(page).to have_content peep.content
  end
end
