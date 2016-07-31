
feature 'Shows list of posts' do
  scenario 'I can see the list of posts users submitted' do
    visit '/posts/new'
    expect(page).to have_content('New Posts')
    fill_in 'post', with: 'Hello, world!'
    click_button 'post it'
    visit '/posts'

    expect(page.status_code).to eq 200
    expect(page).to have_content('Hello, world!')
  end
end
