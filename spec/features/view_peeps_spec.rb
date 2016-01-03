feature 'displays peeps' do

  new_time = DateTime.new(2016, 1, 1, 10, 0, 0)
  Timecop.freeze(new_time)

  before(:all) do
    sign_up
    post_peep('1')
    post_peep('2')
    post_peep('3')
  end

  scenario 'peeps are shown in reverse chronological order' do
    visit '/'
    expect(page).to have_selector("ul#peeps li:nth-child(1)", text: '3')
    expect(page).to have_selector("ul#peeps li:nth-child(2)", text: '2')
    expect(page).to have_selector("ul#peeps li:nth-child(3)", text: '1')
  end

  scenario 'displays name and username for each peep' do
    visit '/'
    expect(page).to have_content("New User whoami\n1")
  end

  scenario 'displays the time a peep was posted' do
    visit '/'
    expect(Peep.first.created_at).to eq new_time
    expect(page).to have_selector("ul#peeps li:nth-child(1)", text: '10:00AM 01 Jan 2016')
  end

end
