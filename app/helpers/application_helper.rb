module ApplicationHelper

  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map {
      |msg| content_tag(:li, msg) }.join
    html = <<-HTML
<div class="alert alert-danger alert-error">
<a ref="#" class="close" data-dismiss="alert" &#215;></a>
<%= content_tag :div, msg if msg.is_a?(String) %>
</div>
HTML
    html.html_save
  end

end
