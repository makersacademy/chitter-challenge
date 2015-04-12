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

  scenario '...in reverse chronological order' do
    expect(find("ol#peeps li:nth-child(1)").text).to eq 'Hola!'
    expect(find("ol#peeps li:nth-child(2)").text).to eq 'Cheerio!'
    expect(find("ol#peeps li:nth-child(3)").text).to eq 'Howdy!'
    expect(find("ol#peeps li:nth-child(4)").text).to eq 'Hiya!'
  end

  scenario 'user peeps are visible under "My Peeps" after submission' do
    find_button('My Peeps').click
    expect(current_path).to eq('/mypeeps/')
    expect(page).to have_no_content('Hiya!')
    expect(page).to have_no_content('Howdy!')
    expect(page).to have_content('Cheerio!')
    expect(page).to have_content('Hola!')
  end

  scenario '...in reverse chronological order' do
    find_button('My Peeps').click
    expect(find("ol#peeps li:nth-child(1)").text).to eq 'Hola!'
    expect(find("ol#peeps li:nth-child(2)").text).to eq 'Cheerio!'
  end
end
