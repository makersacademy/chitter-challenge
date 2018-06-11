feature 'Sort by' do
  scenario 'user can sort alphabetically' do
    visit("/")
    allow_any_instance_of(Time).to receive(:now).and_return(Time.now.strftime("%Y-%m-%d"))
    add_film_with_rating("Cars", "5")
    add_film_with_rating("A Bugs Tale", "8")
    add_film_with_rating("Back to the Future", "9")

    click_button("sort-alphabetically")

    expect(page).to have_content("A Bugs Tale 8/10 #{Time.now.strftime("%Y-%m-%d")} Comment
      Back to the Future 9/10 #{Time.now.strftime("%Y-%m-%d")} Comment
      Cars 5/10 #{Time.now.strftime("%Y-%m-%d")} Comment")
  end

  xscenario 'user can sort by rating' do

  end

  def add_film_with_rating(title, rating)
    click_button("addfilm")
    fill_in("title", with: "#{title}")
    fill_in("rating", with: "#{rating}")
    click_button("Submit")
  end
end
