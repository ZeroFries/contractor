# =====================================================================
# ================         Admin and Project         ==================
# =====================================================================


admin = User.create!(
	email: "sgarvagh@gmail.com",
	password: "abc123",
)

project = Project.create!(
	name: "Test Project",
	address: {
		city: "Fake City",
		region: "Ontario",
		country: "Canada",
		street: "Sprinfield Ct",
		street_number: "1234",
		unit_number: "1",
		postal_code: "L5Y 6L6",
	},
	description: "Demo of Contractor Project Mgmt",
	property_type: "Software",
	architect_info: {
		first_name: "Stuart",
		last_name: "Garvagh",
		email: "sgarvagh@gmail.com",
		address: {
			city: "Fake City",
			region: "Ontario",
			country: "Canada",
			street: "Sprinfield Ct",
			street_number: "1234",
			unit_number: "1",
			postal_code: "L5Y 6L6",
		},
		phone_number: "(123) 123-1234"
	},
	general_contractor_info: {
		first_name: "Chris",
		last_name: "Lougheed",
		email: "chris@tandcgroup.ca",
		address: {
			city: "Fake City",
			region: "Ontario",
			country: "Canada",
			street: "Sprinfield Ct",
			street_number: "1234",
			unit_number: "1",
			postal_code: "L5Y 6L6",
		},
		phone_number: "(123) 123-1234"
	},
	landlord: "Steve Baker",
	allow_drawings: true,
	allow_photos: true
)

# =====================================================================
# ==================              Trades           ====================
# =====================================================================

project_admin = ProjectUser.create!(
	user: admin,
	project: project,
	role: "admin"
)

plumber = Trade.create!(
	project: project,
	name: "plumber"
)
electrician = Trade.create!(
	project: project,
	name: "electrician"
)
programmer = Trade.create!(
	project: project,
	name: "programmer"
)
electricians = 3.times.map do |i|
	user = User.create!(
		email: "plumber#{i}@gmail.com",
		password: "plumber#{i}",
	)
	ProjectUser.create!(
		user: user,
		project: project,
		role: "sub_trade",
		trade: plumber
	)
	user
end
electricians = 4.times.map do |i|
	user = User.create!(
		email: "electrician#{i}@gmail.com",
		password: "electrician#{i}",
	)
	ProjectUser.create!(
		user: user,
		project: project,
		role: "sub_trade",
		trade: electrician
	)
	user
end
programmers = 1.times.map do |i|
	user = User.create!(
		email: "programmers#{i}@gmail.com",
		password: "programmers#{i}",
	)
	ProjectUser.create!(
		user: user,
		project: project,
		role: "sub_trade",
		trade: programmer
	)
	user
end


# =====================================================================
# ===============            Project Misc             =================
# =====================================================================

Event.create!(
	name: "make this thing",
	start_at: 2.weeks.ago,
	end_at: 2.weeks.from_now,
	priority: :medium,
	project: project
)

DateChangeRequest.create!(
	event_id: Event.first.id,
	project: project,
	start_at: 2.weeks.ago,
	end_at: 3.weeks.from_now,
	reason: "delays",
	trades_affected: [Trade.last.id].join(", "),
)

Note.create!(
	content: "Writing some seeds",
	project: project,
	user: admin
)

ChangeOrderRequest.create!(
	description: "Need you to make this instead",
	project: project,
	trade_id: Trade.last.id,
	backcharge_to_trade: true,
	contract: true,
	contract_amount: 1244,
	time_and_material: true
)
