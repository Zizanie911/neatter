module ApplicationHelper
  def better_time(object)
    object.strftime("%A %-d %B %Y")
  end
end
