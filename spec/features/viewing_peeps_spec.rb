feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Log in to Chitter"
  end

  scenario 'a user can see peeps' do
    visit('/peeps')
    expect(page).to have_content "It always seems impossible until it's done. - Nelson Mandela"
    expect(page).to have_content "The greatest glory in living lies not in never falling, but in rising every time we fall. - Nelson Mandela"
    expect(page).to have_content "Something very big has just happened! - Donald Trump"
    expect(page).to have_content "I am slow to learn and slow to forget that which I have learned. My mind is like a piece of steel, very hard to scratch any thing on it and almost impossible after you get it there to rub it out. - Abraham Lincoln"
    expect(page).to have_content "The secret of life is to have no fear. - Fela Kuti"
  end
end
