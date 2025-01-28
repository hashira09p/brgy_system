class BarangayDomainConstraint
  def matches?(request)
    domains = Rails.application.config_for(:domain).fetch(:barangay, [])
    domains.include? request.domain.downcase
  end
end