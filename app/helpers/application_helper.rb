module ApplicationHelper
  def full_title(title)
    base = 'Список поступающих в УрФУ'
    if title.empty?
      base
    else
      "#{title} | #{base}"
    end
  end
end
