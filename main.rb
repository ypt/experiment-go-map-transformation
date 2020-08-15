while line = gets&.chomp do
  # SETUP - PARSE INPUT
  # ------------------

  # Parse the data from a line. Each line represents a single query along with the data to query.
  line_segments = line.split('|')

  # Parse the permissions that are requested
  requested_permissions = line_segments[0].split(',')

  # Parse permissions for each domain - permissionsByDomain is a map of domain id's to permissions
  permissions_by_domain = {}
  line_segments[1..].each do |domain_segment|
    domain_data = domain_segment.split(',')
    domain_id = domain_data[0]
    domain_permissions = domain_data[1..]
    permissions_by_domain[domain_id] = domain_permissions
  end

  # WORK
  # ----

  # implementation 1
  filtered_permissions = {}
  permissions_by_domain.each do |domain_id, permissions|
    filtered_perms = permissions & requested_permissions
    if filtered_perms.length > 0
      filtered_permissions[domain_id] = filtered_perms
    end
  end

  # implementation 2
  # filtered_permissions = permissions_by_domain.each_with_object({}) do |(domain_id, permissions), a|
  #   a[domain_id] = permissions & requested_permissions
  # end.select { |k, v| v.length > 0 }

  # implementation 3
  # filtered_permissions = permissions_by_domain.map do |domain_id, permissions|
  #   [
  #     domain_id,
  #     requested_permissions & permissions
  #   ]
  # end.select { |tuple| tuple[1].length > 0 }.to_h

  # implementation 4
  # filtered_permissions = {}
  # permissions_by_domain.each do |domain_id, permissions|
  #   permissions.each do |permission|
  #     if requested_permissions.include?(permission)
  #       if !filtered_permissions[domain_id]
  #         filtered_permissions[domain_id] = []
  #       end
  #       filtered_permissions[domain_id] << permission
  #     end
  #   end
  # end
end
