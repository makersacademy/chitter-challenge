
feature 'posting twits to tweeter' do
  let (:content) { 'build the wall, the best walls, the best, trust me' }
  scenario 'user is logged in and posts tweet' do
    sign_up
    visit '/'
    click_link 'compose twit'
    expect(current_path).to eq '/twit/new'
    fill_in :content, with: content
    click_button 'twit'

    expect(Twit.first.content).to eq content
    expect(current_path).to eq '/'
    expect(page).to have_content content
  end
end
