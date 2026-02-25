NiceCategory.destroy_all

NiceCategory.create(name:"Oversight and Governance", category_code: "OG", description: "Provides leadership, management, direction, and advocacy so the organization may effectively manage cybersecurity-related risks to the enterprise and conduct cybersecurity work.")
NiceCategory.create(name:"Design and Development", category_code: "DD", description: "Conducts research, conceptualizes, designs, develops, and tests secure technology systems, including on perimeter and cloud-based networks.")
NiceCategory.create(name:"Implementation and Operation", category_code: "IO", description: "Provides implementation, administration, configuration, operation, and maintenance to ensure effective and efficient technology system performance and security.")
NiceCategory.create(name:"Protection and Defense", category_code: "PD", description: "Protects against, identifies, and analyzes risks to technology systems or networks. Includes investigation of cybersecurity events or crimes related to technology systems and networks.")
NiceCategory.create(name:"Investigation", category_code: "IN", description: "Collects, processes, analyzes, and disseminates information from all sources of intelligence on foreign actors' cyberspace programs, intentions, capabilities, research and development, and operational activities.")

puts "Created #{NiceCategory.count} NICE categories."