require 'kramdown'

module ApplicationHelper

  def markdown(text)
    Kramdown::Document.new(text).to_html.html_safe
  end

  def navigation_link(name, url)
    class_name = active_class_name(url)
    link = link_to(name, url)
    content_tag(:li, link, class: class_name)
  end

  def admin_sidebar_item(link, title, icon)
    Rails.logger.debug("path is #{request.path}")
    class_name = active_class_name(link)
    span_text = content_tag(:span, title, class: 'item-text')
    icon = content_tag(:em, "", class: "fa fa-#{icon}")
    link = content_tag(:a, raw("#{icon} #{span_text}"), class: 'no-submenu', title: title, href: link)
    content_tag(:li, raw(link), class: class_name)
  end

  def admin_sidebar_submenu_item(link, title)
    class_name = active_class_name(link)
    link = content_tag(:a, title, href: link, class: 'no-submenu', title: title)
    content_tag(:li, raw(link), class: class_name)
  end

  def active_class_name(link)
    return 'active' if request.path == link
    class_name = request.path.split('/').include?(link.split('/').last) ? "active" : ""
    return class_name
  end

end
