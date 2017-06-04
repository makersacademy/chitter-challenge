feature 'show timestamp' do
  scenario 'see the time at which a beep was made' do
    Beep.create(body: "This is a beep to check timestamps.", created_at: 1_496_590_681)
    visit '/beeps'
    expect(page).to have_content('Posted: 2017-06-04 17:38:01')
  end
end
