describe 'add peep' do
  scenario 'user adds peep' do
    visit '/'
    fill_in('peep').with("Now I've had the time of my life. No, I never felt like this before")
    click_on 'submit'
    expect(page).to have_content("Now I've had the time of my life. No, I never felt like this before")
  end
end
