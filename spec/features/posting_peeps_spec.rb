feature 'Posting peeps' do
  
  scenario 'can post a new peep if logged in' do
    user = build :user
    sign_up_as(user)
    sign_in(user)
    visit '/peeps/new'
    fill_in 'peep', with: 'Hello, world'
    click_button 'Post peep'
    expect(Peep.count).to eq(1)
    expect(current_path).to eq('/peeps')
  end

  scenario 'can view peeps' do
    Peep.create(message: 'Hello, world')
    visit '/peeps'
    expect(page).to have_content('Hello, world')
  end

  scenario 'must be logged in' do
    visit '/peeps/new'
    fill_in 'peep', with: 'Hello, world'
    click_button 'Post peep'
    expect(Peep.count).to eq 0
    expect(page).to have_content('You must be logged in to peep')
    expect(current_path).to eq('/peeps')
  end
end