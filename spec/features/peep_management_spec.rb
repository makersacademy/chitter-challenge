feature 'Viewing peeps' do

  let(:user){create :user}
  let(:peep){build :peep}

  scenario 'visiting the home page I see the peeps listed' do
    log_in(user)
    post(peep)
    post(peep)
    sign_out
    visit '/'
    expect(page).to have_content("This is a lovely peep", count: 2)
  end

  scenario 'peeps are listed in reverse chronological order' do
    peep1 = build(:peep, message: "First peep")
    peep2 = build(:peep, message: "Second peep")
    peep3 = build(:peep, message: "Third peep")
    log_in(user)
    start_time = Time.local(2015,9,27,13,30,00)
    Timecop.travel(start_time)
    Timecop.scale(3600)
    post(peep1)
    sleep(1)
    post(peep2)
    sleep(1)
    post(peep3)
    expect(page).to have_css("ul#peeps li:nth-child(1)", text: "#{peep3.message}")
    expect(page).to have_css("ul#peeps li:nth-child(2)", text: "#{peep2.message}")
    expect(page).to have_css("ul#peeps li:nth-child(3)", text: "#{peep1.message}")
  end

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
    post_after_click(peep)
    expect(current_path).to eq '/'
    expect(page).to have_content "This is a lovely peep"
  end

  scenario 'user must be logged in to post peeps' do
    sign_out
    visit '/peeps/new'
    post_after_click(peep)
    expect(page).to have_content "You need to sign in to peep!"
    expect(page).not_to have_content "This is a lovely peep"
  end

  scenario 'peeps have the username of the user that added them' do
    post(peep)
    expect(page).to have_content "Posted by #{user.username}"
  end

  scenario 'peeps have the time they were posted' do
    Timecop.freeze(Time.local(2015,9,27,13,30,00))
    post(peep)
    expect(page).to have_content "13:30 27/09/2015"
  end

end