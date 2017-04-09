feature 'visiting our profile' do

  scenario 'viewing own posts' do
    sign_up_steph
    visit '/posts/new'
    fill_in('content', with: 'This is a test peep')
    click_button('Peep!')
    visit '/posts/StephanieJane'
    expect(page).to have_content('This is a test peep')
  end

end
