feature 'Navigating' do
  scenario "User can navigate to messages" do
    visit '/'
    click_button('Messages')

    expect(current_path).to eq '/messages'

    expect(page).to have_content 'Messages'
    expect(page).to have_button 'Create message'
    expect(page).not_to have_content 'error'
  end

  # scenario "user can log in and the page changes" do
    
  # end
end