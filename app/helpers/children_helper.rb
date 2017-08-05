module ChildrenHelper
  def years_since_date(date)
    today = Date.today
    years = today.year - date.year

    if today.month > date.month
      years
    elsif today.month < date.month
      years - 1
    elsif today.day >= date.day
      years
    else
      years - 1
    end
  end
end
