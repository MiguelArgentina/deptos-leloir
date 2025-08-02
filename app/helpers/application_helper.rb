module ApplicationHelper
  # helpers/application_helper.rb
  def flash_class(type)
    case type.to_sym
    when :notice then "bg-emerald-100 text-emerald-800 border border-emerald-200"
    when :alert  then "bg-red-100 text-red-700 border border-red-200"
    else "bg-gray-100 text-gray-800 border border-gray-300"
    end
  end

end
