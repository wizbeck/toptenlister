module BootstrapHelper
  # navbar active classes on the path selected
  def active_class(path)
    'active' if request.path == path
  end

  def alert_class(key)
    # Use this method to determing the color of the alert container to render the proper colored alert.
    case key
    when notice
      'warning' # yellow
    when info
      'info' # light blue
    when success
      'success' # green
    when error
      'danger' # red
    else
      ''
    end
  end
end
