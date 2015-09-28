feature 'Viewing peeps' do

  let(:user){create :user}
  let(:peep){build :peep}

  scenario 'visiting the home page I see the peeps listed' do
    log_in(user)
    click_button 'New peep!'
    post(peep)
    click_button 'New peep!'
    post(peep)
    sign_out
    visit '/'
    expect(page).to have_content("This is a lovely peep", count: 2)
  end

  # scenario 'peeps are listed in reverse chronological order' do

  # end

end

feature 'Adding peeps' do

  let(:user){build :user}
  let(:peep){build :peep}

  before do
    create :user
    log_in(user)
  end

  scenario 'user can post peeps' do
    visit '/'
    click_button 'New peep!'
    expect(current_path).to eq '/peeps/new'
    post(peep)
    expect(current_path).to eq '/'
    expect(page).to have_content "This is a lovely peep"
  end

  scenario 'user must be logged in to post peeps' do
    sign_out
    visit '/peeps/new'
    post(peep)
    expect(page).to have_content "You need to sign in to peep!"
    expect(page).not_to have_content "This is a lovely peep"
  end

  scenario 'peeps have the username of the user that added them' do
    click_button 'New peep!'
    post(peep)
    expect(page).to have_content "Posted by #{user.username}"
  end

  scenario 'peeps have the time they were posted' do
    Timecop.freeze(Time.local(2015,9,27,13,30,00))
    click_button 'New peep!'
    post(peep)
    expect(page).to have_content "13:30 27/09/2015"
  end

end