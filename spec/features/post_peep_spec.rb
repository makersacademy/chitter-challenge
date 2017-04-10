feature 'Posting peeps' do
  scenario 'page works' do
    visit '/peeps/new'
    expect(page.status_code).to eq 200
  end

  scenario 'post a new peep' do
    visit '/peeps/new_peep'
    fill_in(:peep, with: 'This is my first peep')
    click_button 'Post'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'This is my first peep'
  end

end
