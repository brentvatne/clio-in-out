module ApplicationHelper
  def name_with_status(name, status, user_id, options = {})
    if options[:show_edit]
      extra = link_to("Edit", edit_user_path(id: user_id), :class => "update-link")
    else
      extra = ''
    end

    content_tag(:div, class: "user-status is-#{status}", data: {id: user_id}) do
      link_to(name, user_path(user_id), class: "user name") +
      content_tag(:span, status, class: "status") +
      extra
    end
  end
end
