module ApplicationHelper
  # navbar active classes on the path selected
  def active_class(path)
    'active' if request.path == path
  end
end
