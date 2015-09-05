require "iro/version"

module Iro
  BLACK = 0
  RED = 1
  GREEN = 2
  BLUE = 21
  PURPLE = 5
  CYAN = 6
  GREY = 8
  YELLOW = 11
  PINK = 13
  WHITE = 231
  LOG = nil

  def log_width
  	return 60
  end

  def background_color
  	return BLUE
  end

  def text_color
  	return WHITE
  end

  def border_color
    return WHITE
  end

  def border
    format = color_bg_and_text(background_color, border_color) + "|" + reset
  	return format
  end

  def color_text color
    return "\e[38;5;#{color}m"
  end

  def color_bg_and_text *args
    bg_color = args[0] ? args[0] : bg_color = background_color
    color = args[1] ? args[1] : color = text_color

    return "\e[48;5;#{bg_color}m\e[38;5;#{color}m"
  end

  def reset
    return "\e[0m"
  end


  def log_text(*args)
    # Variables
    input_string = args[0]
    color = args[1] ? args[1] : color = text_color
    bg_color = args[2] ? args[2] : bg_color = background_color

    # Processing
  	output = border + color_bg_and_text(bg_color, color) + ("  " + input_string.ljust(log_width - 4)) + reset + border
  	puts output
  	LOG << output + "\n" if LOG != nil
  end

  def log_title(*args)
    # Variables
    input_string = args[0]
  	color = args[1] ? args[1] : color = text_color
    bg_color = args[2] ? args[2] : bg_color = background_color
  	line = color_bg_and_text(bg_color, color) + ("+".ljust(log_width - 1, '-') + "+") + reset

    #Processing
  	output = line + "\n" + border + color_text(color) + input_string.center(log_width - 2) + reset + border + "\n" + line
  	puts output
  	LOG << output + "\n" if LOG != nil
  end

  def log_break
  	output = color_bg_and_text(background_color, text_color) + ("+".ljust(log_width - 1, '-') + "+") + reset
  	puts output
  	LOG << output + "\n" if LOG != nil
  end

  def log_head(*args)
    # Variables
    input_string = args[0]
    color = args[1] ? args[1] : color = text_color
    bg_color = args[2] ? args[2] : bg_color = background_color
    b_color = args[3] ? args[3] : b_color = color

    # Reset values for spacing due to color characters
    c1 = color_text(color).length
    c2 = color_text(b_color).length
    num = (c1 + c2) - 2

    text = color_text(color) + input_string + color_text(b_color)
    format = color_text(b_color) + ((" " + text + " ").center(log_width + num, '-')) + reset
  	output = border + color_bg_and_text(bg_color, color) + format + reset + border

  	puts output
  	LOG << output + "\n" if LOG != nil
  end
end
