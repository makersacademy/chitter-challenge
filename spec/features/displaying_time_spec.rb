feature 'posts are displayed with the time of creation' do
  scenario 'user can see time next to peep' do
    sign_in_and_play
    expect(page).to have_content ("#{Time.new.strftime('%Y-%m-%d')}")
    expect(page).to have_content ("Time: /\d\d:\d\d:\d\d/ GMT")
  end
end
