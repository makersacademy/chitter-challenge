feature 'new peep' do

  scenario 'user can see their peep in the feed' do
    sign_up
    new_peep
    expect(current_path).to eq '/feed'
    within 'ul#peeps' do
      expect(page).to have_content "Hello world, what a wonderful day! To infinity and beyond!"
      expect(page).to have_content "@SuperRafi"
    end
      # add test for time using Timecop
  end

  scenario 'database stores new peep' do
    sign_up
    new_peep
    expect{new_peep}.to change{Peep.count}.by(1)
  end

end
