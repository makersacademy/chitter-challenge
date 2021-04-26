feature 'the time and date is shown' do
  scenario 'a peep posts a peep and sees the time and date it was posted' do
    visit '/'
    fill_in('peep', with: 'Hello world')
    click_button('Post your peep')
    expect(page).to have_content "#{Time.now.strftime("%Y-%m-%d %I:%M %p")}"
  end 
end
