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

  def present_contact_title(title)
    {
      'mother' => 'Mor',
      'father' => 'Far',
      'foster_mother' => 'Plejemor',
      'foster_father' => 'Plejefar'
    }[title]
  end

  def contact_title_options
    options = *Contact::TITLES.map { |t| [present_contact_title(t), t] }
    options.unshift ['Vælg relation', '']
    options
  end
end
