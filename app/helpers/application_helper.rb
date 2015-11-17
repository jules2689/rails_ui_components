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

end
