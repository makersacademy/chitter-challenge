def add_film_with_rating(title, rating)
  click_button("addfilm")
  fill_in("title", with: "#{title}")
  fill_in("rating", with: "#{rating}")
  click_button("Submit")
end
