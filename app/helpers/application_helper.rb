module ApplicationHelper
  def better_time(object)
    object.strftime("%A %-d %B %Y")
  end

  def day_time(object)
    object.strftime("%a")
  end

  def day_number(object)
    object.strftime("%d")
  end
end
