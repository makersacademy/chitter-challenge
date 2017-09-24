feature 'Creating new BLABBER posts' do
  scenario 'I can make new BLABBER posts on page' do
    sign_up
    visit('/posts')
    fill_in 'body', with: 'Hi, this is thomas!'
    click_button 'SEND!'

    expect(current_path).to eq '/posts'

    within 'ul#posts' do
      expect(page).to have_content('Hi, this is thomas!')
    end
  end

  scenario 'New BLABBER posts are in reverse order' do
    sign_up
    visit('/posts')
    fill_in 'body', with: 'First'
    click_button 'SEND!'

    visit('/posts')
    fill_in 'body', with: 'Second'
    click_button 'SEND!'

    expect(current_path).to eq '/posts'

    within 'ul#posts' do
      expect(page.body.index('Second')).to be < page.body.index('First')
    end
  end
end
