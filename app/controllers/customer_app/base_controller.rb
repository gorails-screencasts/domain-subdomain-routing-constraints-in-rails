class CustomerApp::BaseController < ApplicationController
  before_action :set_account

  def set_account
    if request.domain == MarketingConstraint::DOMAIN
      @account = Account.find_by!(subdomain: request.subdomain)
    else
      @account = Account.find_by(domain: request.domain)
    end
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Account does not exist" }
  end
end
