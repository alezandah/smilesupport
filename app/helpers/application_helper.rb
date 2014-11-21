module ApplicationHelper
  def is_make?(page_name)
    "active" if params[:action] == page_name
  end
  def is_page_selected(page)
    current_page.url == page ? "selected" : ''
  end

  def is_active?(link_path)
    if current_page?(link_path)
      "active"
    else
      ""
    end
  end
end
