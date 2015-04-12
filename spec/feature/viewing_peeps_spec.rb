feature 'Viewing peeps' do

  before :each do
    sign_up
    post_peep('Hiya!')
    post_peep('Howdy!')
    sign_out
    sign_up('b@b.com', 'hello', 'hello')
    post_peep('Cheerio!')
    post_peep('Hola!')
  end

  scenario 'can see ALL peeps on the homepage' do
    expect(page).to have_content('Hiya!')
    expect(page).to have_content('Howdy!')
    expect(page).to have_content('Cheerio!')
    expect(page).to have_content('Hola!')
  end

  scenario 'user peeps are visible under "My Peeps" after submission' do
    find_button('My Peeps').click
    expect(current_path).to eq('/mypeeps/')
    expect(page).to have_no_content('Hiya!')
    expect(page).to have_no_content('Howdy!')
    expect(page).to have_content('Cheerio!')
    expect(page).to have_content('Hola!')
  end
end
