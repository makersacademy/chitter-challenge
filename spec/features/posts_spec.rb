
describe 'Viewing posts' do

  it 'I can see existing posts on the post page' do

    Post.create(peep: 'okm8')

    visit '/posts'

    within 'ul#posts' do
      expect(page).to have_content('okm8')
    end
  end
end

feature 'Creating posts' do

  scenario 'I can create a new post when logged in' do
    sign_up
    sign_in(email: 'Jeff@example.com', password: '1234')
    visit '/posts'
    fill_in 'peep', with: 'MOO'
    click_button 'Post'

    expect(current_path).to eq '/posts'

    expect(page).to have_content('MOO')
  end

  scenario 'no post box when logged out' do
    visit '/posts'
    expect(page).not_to have_content('Peep:')
  end
end
