feature 'Posting peeps' do
  
  scenario 'can post a new peep' do
    user = build :user
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
end