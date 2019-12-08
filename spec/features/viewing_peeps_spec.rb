feature 'viewing_peeps' do

  provocative_opinion_1 = "I like making words with letters and stuff"
  provocative_opinion_2 = "Crisp sandwiches for breakfast, yeah?"

  before :each do
    add_row provocative_opinion_1
    add_row provocative_opinion_2
  end

  scenario 'user can see peeps' do
    visit '/peeps'

    expect(page).to have_content provocative_opinion_1
    expect(page).to have_content provocative_opinion_2
  end
end
