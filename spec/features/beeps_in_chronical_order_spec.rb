feature 'chronical order' do
  scenario 'shows 2 beeps in right chronical order' do
    Beep.create(body: "This is the old beep.", created_at: Time.new(2000).to_i)
    Beep.create(body: "This is the new beep.", created_at: Time.now.to_i)
    visit '/beeps'
    expect(page).to have_content('This is the new beep. This is the old beep.')
  end
end
