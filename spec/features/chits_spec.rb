feature 'viewing chits' do

  before (:each) do
    user = add_user(build(:user))
    Chit.create(time: Time.local(2015, 9, 1, 10, 5, 0),
                text: 'Far far away ',
                user: user)
    Chit.create(time: Time.local(2015, 9, 2, 10, 5, 0),
                text: 'Very far away ',
                user: user)
    Chit.create(time: Time.local(2015, 9, 1, 10, 4, 0),
                text: 'FIRST POST ',
                user: user)
  end


  scenario 'Visit chits page' do
    visit '/chits'
    expect(current_path).to eq '/chits'
    expect(page.status_code).to eq 200
  end

  scenario 'Can list chits' do
    visit '/chits'
    expect(page).to have_content("FIRST POST")
  end

  scenario 'Lists chits in reverse chronoligical order' do
    visit '/chits'
    expect(page).to have_content("Recent Chits Very far away")
  end

  scenario 'Posts new chit' do
    user = add_user(build(:user))
    visit '/chits'
    sign_in(user)
    fill_in :chit,    with: 'This is a test'
    click_button 'Post'
    expect(page).to have_content("This is a test")
  end






end
