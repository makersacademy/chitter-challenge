module Hobbit
  module Mote


    def default_layout
      "#{layouts_path}/layout.mote"
    end

    def layouts_path
      "#{views_path}"
    end

    def views_path
      'app/views'
    end

  end
end
