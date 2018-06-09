feature 'Sort by' do
  scenario 'user can sort alphabetically' do
    visit("/")

    add_film_with_rating("Cars", "5")
    add_film_with_rating("A Bugs Tale", "8")
    add_film_with_rating("Back to the Future", "9")


  end

  def add_film_with_rating(title, rating)
    click_button("addfilm")
    fill_in("title", with: "#{title}")
    fill_in("rating", with: "#{rating}")
    click_button("Submit")
  end
end
