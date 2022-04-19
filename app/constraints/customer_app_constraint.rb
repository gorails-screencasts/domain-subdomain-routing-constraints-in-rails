class CustomerAppConstraint
  RESERVED_SUBDOMAINS = ["help", "support", "dev"]

  def self.matches?(request)
    return true if request.domain != MarketingConstraint::DOMAIN

    (RESERVED_SUBDOMAINS + MarketingConstraint::SUBDOMAINS).exclude? request.subdomain
  end
end
