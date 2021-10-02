class ApplicationController < ActionController::API
  def status(marker)
    case marker
      when :customer_not_found
        404
      when :subscription_not_found
        404
      else
        400
    end
  end
end
