feature 'adding a post' do

  scenario 'adding a post' do
    sign_up_steph
    visit '/posts/new'
    fill_in('content', with: 'This is a test peep')
    click_button('Peep!')
    expect(page).to have_content('This is a test peep')
  end

end
