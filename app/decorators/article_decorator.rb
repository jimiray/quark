class ArticleDecorator < Draper::Decorator
  delegate_all

  def title_link
    h.content_tag :h3, link(object.title)
  end

  def link(text, options={})
    h.link_to text, h.article_path(object), options
  end

  def preview
    h.markdown(h.truncate(article.preview, {length: 287, omission: ' [...]'}))
  end

  def body
    h.markdown(article.body)
  end

  def read_button
    link('Read', {class: 'btn read'})
  end

  def published_date
    h.link_to object.created_at.strftime('%B %d, %Y'), '#'
  end

  def posted_by
    h.link_to object.user.name, '#'
  end

  def image
    article.image.url || article.category.image.url
  end


  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
