module ApplicationHelper
  def active_link(path)
    if current_page?(path)
      'bg-green-700 text-white'
    else
      'bg-green-600 text-gray-100'
    end
  end
end
