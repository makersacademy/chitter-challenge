feature 'Creating new BLABBER posts' do

  scenario 'I can make new BLABBER posts on page' do

    visit('/posts/new')
    fill_in 'body', with: 'Hi, this is thomas!'
    click_button 'blab'

    expect(current_path).to eq '/posts'

    within 'ul#posts' do
      expect(page).to have_content('Hi, this is thomas!')
    end
  end

  scenario 'New BLABBER posts are in reverse order' do

    visit('/posts/new')
    fill_in 'body', with: 'first'
    click_button 'blab'

    visit('/posts/new')
    fill_in 'body', with: 'second'
    click_button 'blab'

    expect(current_path).to eq '/posts'

    within 'ul#posts' do
       expect(page.body.index('second')).to be < page.body.index('first')
    end
  end
end
