def clear_peeps
  Peep.remove_instance_variable :@peeps if Peep.instance_variable_defined? :@peeps
end
