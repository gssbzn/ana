# App Helper
module ApplicationHelper
  #Set the title of the page
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  #Set the description of the page
  def description(page_description)
    content_for(:description) { page_description }
  end
end
