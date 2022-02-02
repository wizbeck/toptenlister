module LayoutHelper
  def time_ago(entity)
    # time ago concats whitespace and 'ago'
    time_ago_in_words(entity.updated_at).concat(' ', 'ago')
  end
end
