feature 'Posting peeps' do

  skip 'there are no peeps in the database' do
    visit '/posts/new'
    fill_in 'post', with: 'My first peep!'
    click_button 'peep'
    expect(Peep.count).to eq 1
  end
  skip 'user\'s can create a new peep' do
    visit '/posts/new'
    fill_in 'post', with: 'My first peep!'
    click_button 'peep'
    expect(current_path).to eq '/posts'
    within 'ul#posts' do
      expect(page).to have_content('My first peep!')
    end
  end
end