feature 'time' do

  scenario 'peeps show the time at which they were posted' do
    visit '/new_message'
    fill_in 'message', with: 'Hello world'
    click_on 'Post'
    expect(page).to have_content "#{Time.now.strftime("%k:%M:%S on %d/%m/%Y")}"
  end

end
