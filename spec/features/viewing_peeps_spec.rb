feature 'viewing_peeps' do
  scenario 'user can see peeps' do
    visit '/peeps'

    provocative_opinion_1 = "I like making words with letters and stuff"
    provocative_opinion_2 = "Crisp sandwiches for breakfast, yeah?"

    expect(page).to have_content provocative_opinion_1
    expect(page).to have_content provocative_opinion_2
  end
end
