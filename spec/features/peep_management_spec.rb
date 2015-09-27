feature 'Viewing peeps' do

  let(:user){build :user}

  before do
    create :user
    log_in(user)
    click_button 'New peep!'
    post_peep
    click_button 'New peep!'
    post_peep
    sign_out
  end

  scenario 'visiting the home page I see the peeps listed' do
    visit '/'
    expect(page).to have_content("This is a lovely peep", count: 2)
    # expect(page).to have_content "Next peepsp"
  end

end

feature 'Adding peeps' do

  let(:user){build :user}

  before do
    create :user
    log_in(user)
  end

  scenario 'user can post peeps' do
    visit '/'
    click_button 'New peep!'
    expect(current_path).to eq '/peeps/new'
    post_peep
    expect(current_path).to eq '/'
    expect(page).to have_content "This is a lovely peep"
  end

  scenario 'user must be logged in to post peeps' do
    sign_out
    visit '/peeps/new'
    post_peep
    expect(page).to have_content "You need to sign in to peep!"
    expect(page).not_to have_content "This is a lovely peep"
  end

  scenario 'peeps have the username of the user that added them' do
    click_button 'New peep!'
    post_peep
    expect(page).to have_content "Added by #{user.username}"
  end

end