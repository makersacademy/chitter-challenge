
def send_a_peep
  visit ('/messages')
  fill_in :peep, with: "I am a stupid and vapided peeper"
  click_button "Peep"
end

def todays_date_toady
  time = Time.new
  values = time.to_a
  Time.utc(*values)

end
