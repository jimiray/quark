module ArticlesHelper


  def article_title(article)
    content_tag :h3, article_link(article, article.title)
  end

  def article_link(article, link_text)
    link_to link_text, article_path(article)
  end

  def article_preview(article)
    markdown(truncate(article.preview, {length: 287, omission: ' [...]'}))
  end

  def category_link(category)
    content_tag :div, category_link(article.category)
  end
end
