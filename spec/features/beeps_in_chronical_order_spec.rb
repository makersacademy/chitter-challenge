feature 'chronical order' do
  scenario 'shows 2 beeps in right chronical order' do
    Beep.create(body: "This is the old beep.", created_at: Time.new(2000).to_i)
    Beep.create(body: "This is the new beep.", created_at: 1_496_590_681)
    visit '/beeps'
    expect(page).to have_content('This is the new beep. Posted: 2017-06-04 16:38:01 +0100 This is the old beep.')
  end
end
