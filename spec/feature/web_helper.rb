
def send_a_peep(count)
  fill_in :peep, with: "Peep #{count}"
  click_button "Peep"
end
