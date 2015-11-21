module ApplicationHelper
  def indefinite_articlerize(params_word)
    %w(a e i o u).include?(params_word[0].downcase) ? "an #{params_word}" : "a #{params_word}"
  end

  def opts_to_string(opts)
    opts.collect do |opt, val|
      wrapped_val = val.is_a?(String) ? "\"#{val}\"" : val
     "#{opt}: #{wrapped_val}"
    end.join(", ")
  end

  def classes_for(_module, type, config, class_set)
    button_config = _module.instance_method(config).bind(self).call()
    button_config[type]["class_sets"][class_set]["classes"]
  end

end
