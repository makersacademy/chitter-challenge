class String
  def secure
    return self.gsub(/[<>&"']/, "&" => "&amp;", "<" => "&lt;", ">" => "&gt;", '"' => "&quot;", "'" => "&#39;")
  end
end
