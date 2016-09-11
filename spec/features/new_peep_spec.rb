feature 'Feature: new peep' do

  scenario 'user can see their peep in the feed' do
    sign_up
    new_peep
    peep_time = Peep.first.get_time
    expect(current_path).to eq '/feed'
    within 'div#peeps' do
      expect(page).to have_content "Hello world, what a wonderful day! To infinity and beyond!"
      expect(page).to have_content "@SuperRafi"
      expect(page).to have_content "posted: #{peep_time}"
    end
  end

  scenario 'database stores new peep' do
    sign_up
    new_peep
    expect{new_peep}.to change{Peep.count}.by(1)
  end

  scenario 'peeps are displayed chronologicallly' do
    sign_up
    5.times {new_peep}
    a_different_peep
    expect('Perfect peeps are for perfect people').to appear_before('Hello world, what a wonderful day! To infinity and beyond!')
  end

  scenario 'peeps from different users display correctly' do
    sign_up
    new_peep
    click_button("Log out")
    sign_up_another_user
    expect(page).to have_content("Hello @MatthewP")
    a_different_peep
    expect(page).to have_content("@MatthewP Perfect peeps are for perfect people")
  end

end
