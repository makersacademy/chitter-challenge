module ApplicationHelper
  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def peep_create(source: nil, spacing: "    ")
    if current_user
      peep_form = <<-eos
#{spacing}<div id="peep_new">
#{spacing}  <form method='post' action="/peep/new" id="peep_new">
#{spacing}    Peep: <textarea rows="2" cols="50" name="peep_new_message"></textarea>
eos
      peep_form += "#{spacing}    <input type=\"hidden\" id=\"source\" name=\"source\" value=\"#{source.id}\" />\n" if source
      peep_form += <<-eos
#{spacing}    <input type="submit" value='Peep!'>
#{spacing}  </form>
#{spacing}</div>
eos
    peep_form
    end
  end

  def peep_depth_first_search(source: "", indent: 3, spacing: "  ")
    base_spacing = spacing * indent
    text = ""

    peeps = source == "" ? Peep.all(source: "").sort_time_rev : Peep.all(source: source)

    peeps.each do |peep|
      text += base_spacing + "<li>\n"
      #display
      text += base_spacing + spacing + "#{peep.user.username} (#{peep.created_at.strftime("%d/%m/%y %R")}): #{peep.message}\n"
      #add_replay
      text += peep_create(source: peep, spacing: base_spacing + spacing)
      #call_next_loop
      unless Peep.all(source: peep) == []
        text += base_spacing + spacing + "<ul>\n"
        text += peep_depth_first_search(source: peep, indent: indent + 1)
        text += base_spacing + spacing + "<br></ul>\n"
      end
      text += base_spacing + "</li>\n"
    end
    text
  end
end
