subdomains = %w[philips fonel]
subdomains.each do |subdomain|
  entity = Entity.new
  entity.name = subdomain.upcase + ' Co'
  entity.subdomain = subdomain
  entity.save
end

# Contracts
Entity.all.each do |entity|
  [6, 12, 24].each do |duration|
    contract = entity.contracts.new
    contract.name = Faker::Lorem.word
    contract.duration = duration
    contract.code = "#{duration}-month"
    contract.save
  end
end

# Document Types
Entity.all.each do |entity|
  ['Legal ID', 'Financial Document', 'Current Housing', 'Financial Obligation'].each do |name|
    doc_type = entity.document_types.new
    doc_type.name = name
    doc_type.code = name.downcase.squish.gsub(' ', '-')
    doc_type.save
  end
end

# Users
Entity.all.each do |entity|
  10.times do |i|
    client = entity.clients.new
    client.email = "client-#{i}@#{entity.subdomain}.ea.dave"
    client.password = 'password'
    client.first_name = "Client #{entity.subdomain} #{i}"
    client.last_name = Faker::Name.last_name
    client.save!
  end

  2.times do |i|
    staff = entity.staffs.new
    staff.email = "staff-#{i}@#{entity.subdomain}.ea.dave"
    staff.password = 'password'
    staff.first_name = "Agent #{entity.subdomain} #{i}"
    staff.last_name = Faker::Name.last_name
    staff.save!
  end

  manager = entity.managers.new
  manager.email = "manager@#{entity.subdomain}.ea.dave"
  manager.password = 'password'
  manager.first_name = "Manager #{entity.subdomain}"
  manager.last_name = Faker::Name.last_name
  manager.save!
end

Staff.all.each do |staff|
  10.times do
    house = staff.houses.new
    house.contract_id = Contract.all.sample.id
    house.house_number = Faker::Address.building_number
    house.name = Faker::Lorem.word
    house.street = Faker::Address.street_name
    house.city = Faker::Address.city
    house.post_code = Faker::Address.postcode
    house.status = 'draft'
    house.max_people = rand(1..5)
    house.save
  end
end

Manager.all.each do |manager|
  3.times do
    house = manager.houses.new
    house.contract_id = Contract.all.sample.id
    house.house_number = Faker::Address.building_number
    house.street = Faker::Address.street_name
    house.city = Faker::Address.city
    house.post_code = Faker::Address.postcode
    house.status = 'draft'
    house.max_people = rand(1..5)
    house.save!
  end
end

House.all.sample(10).each do |house|
  client = Client.all.sample
  client.applied_houses << house
end

Client.all.sample(5).each do |client|
  doc = client.documents.new
  doc.document_type = DocumentType.first
  doc.save
end
