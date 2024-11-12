module ApplicationHelper

  def custom_titleize(string)
    string.split.map(&:capitalize).join(' ')
  end
end
