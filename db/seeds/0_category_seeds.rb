NiceCategory.destroy_all

NiceCategory.create(name:"Securely Provision", acronym: "SP", description: "Conceptualizes, designs, procures, and/or builds secure information technology (IT) systems, with responsibility for aspects of system and/or network development.")
NiceCategory.create(name:"Operate and Maintain", acronym: "OM", description: "Provides the support, administration, and maintenance necessary to ensure effective and efficient information technology (IT) system performance and security.")
NiceCategory.create(name:"Oversee and Govern", acronym: "OV", description: "Provides leadership, management, direction, or development and advocacy so the organization may effectively conduct cybersecurity work.")
NiceCategory.create(name:"Protect and Defend", acronym: "PR", description: "Identifies, analyzes, and mitigates threats to internal information technology (IT) systems and/or networks.")
NiceCategory.create(name:"Analyze", acronym: "AN", description: "Performs highly-specialized review and evaluation of incoming cybersecurity information to determine its usefulness for intelligence.")
NiceCategory.create(name:"Collect and Operate", acronym: "CO", description: "Provides specialized denial and deception operations and collection of cybersecurity information that may be used to develop intelligence.")
NiceCategory.create(name:"Investigate", acronym: "IN", description: "Investigates cybersecurity events or crimes related to information technology (IT) systems, networks, and digital evidence.")

puts "Created #{NiceCategory.count} NICE categories."