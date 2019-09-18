module ApplicationHelper
  def active_link(link)
    current_page?(link) ? "active" : ""
  end
end
