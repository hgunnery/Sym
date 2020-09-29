Given /^I have an Admin$/ do
  @admin = FactoryBot.create(:admin)
end

Given /^I have user types$/ do
  unless UserType.all.count == 3 then
		UserType.upsert(id: 1, name: "Admin", created_at: DateTime.now, updated_at: DateTime.now)
    UserType.upsert(id: 2, name: "Supervisor", created_at: DateTime.now, updated_at: DateTime.now)
    UserType.upsert(id: 3, name: "Supporter", created_at: DateTime.now, updated_at: DateTime.now)
  end
end

Given('I have an admin and they are logged in') do
  @admin = FactoryBot.create(:admin)
  visit root_path
  fill_in "email", :with => @admin.email
  fill_in "password", :with => @admin.password
  click_button "Log in"
end


When('I log in') do
  visit root_path
  fill_in "email", :with => @admin.email
  fill_in "password", :with => @admin.password
  click_button "Log in"
end

Given('I have the supporter pre-requisites') do
	unless UserType.all.count == 3 then
		UserType.upsert(id: 1, name: "Admin", created_at: DateTime.now, updated_at: DateTime.now)
    UserType.upsert(id: 2, name: "Supervisor", created_at: DateTime.now, updated_at: DateTime.now)
    UserType.upsert(id: 3, name: "Supporter", created_at: DateTime.now, updated_at: DateTime.now)
  end
	if User.first.nil?
		@admin = FactoryBot.create(:admin)
	end
	unless SupporterLevel.where(name: "Bronze").nil?
		SupporterLevel.create(name: "Bronze", ammount: "5.00")
	end
end

Given('I have a supporter and pre-requisites') do
	unless UserType.all.count == 3 then
    UserType.upsert(id: 1, name: "Admin", created_at: DateTime.now, updated_at: DateTime.now)
    UserType.upsert(id: 2, name: "Supervisor", created_at: DateTime.now, updated_at: DateTime.now)
    UserType.upsert(id: 3, name: "Supporter", created_at: DateTime.now, updated_at: DateTime.now)
  end
	if User.first.nil?
		@admin = FactoryBot.create(:admin)
	end
	@supporter = FactoryBot.create(:supporter)
end

When('I log in as a support') do
	visit root_path
  fill_in "email", :with => @supporter.email
  fill_in "password", :with => @supporter.password
  click_button "Log in"
end

When('I login as the user') do
	visit root_path
  fill_in "email", :with => @supporter.email
  fill_in "password", :with => @supporter.password
  click_button "Log in"
end

Given('I have an admin and a user and the user is logged in') do
	unless UserType.all.count == 3 then
    UserType.upsert(id: 1, name: "Admin", created_at: DateTime.now, updated_at: DateTime.now)
    UserType.upsert(id: 2, name: "Supervisor", created_at: DateTime.now, updated_at: DateTime.now)
    UserType.upsert(id: 3, name: "Supporter", created_at: DateTime.now, updated_at: DateTime.now)
  end
	if User.first.nil?
		@admin = FactoryBot.create(:admin)
	end
	@supporter = FactoryBot.create(:supporter)
	visit root_path
  fill_in "email", :with => @supporter.email
  fill_in "password", :with => @supporter.password
  click_button "Log in"
end

Given('I have an admin and a user and the admin is logged in') do
	unless UserType.all.count == 3 then
    UserType.upsert(id: 1, name: "Admin", created_at: DateTime.now, updated_at: DateTime.now)
    UserType.upsert(id: 2, name: "Supervisor", created_at: DateTime.now, updated_at: DateTime.now)
    UserType.upsert(id: 3, name: "Supporter", created_at: DateTime.now, updated_at: DateTime.now)
  end
	if User.first.nil?
		@admin = FactoryBot.create(:admin)
	end
	@supporter = FactoryBot.create(:supporter)
	visit root_path
  fill_in "email", :with => @admin.email
  fill_in "password", :with => @admin.password
  click_button "Log in"
end

Given('I have a supporter and they are logged in') do
	unless UserType.all.count == 3 then
    UserType.upsert(id: 1, name: "Admin", created_at: DateTime.now, updated_at: DateTime.now)
    UserType.upsert(id: 2, name: "Supervisor", created_at: DateTime.now, updated_at: DateTime.now)
    UserType.upsert(id: 3, name: "Supporter", created_at: DateTime.now, updated_at: DateTime.now)
  end
	if User.first.nil?
		@admin = FactoryBot.create(:admin)
	end
	@supporter = FactoryBot.create(:supporter)
	visit root_path
  fill_in "email", :with => @admin.email
  fill_in "password", :with => @admin.password
  click_button "Log in"
end

When('I log out and log in as a supporter') do
  visit log_out_path
	visit root_path
	fill_in "email", :with => @supporter.email
  fill_in "password", :with => @supporter.password
  click_button "Log in"
end

When('I log out and log in as an admin') do
	visit log_out_path
	visit root_path
	fill_in "email", :with => @admin.email
  fill_in "password", :with => @admin.password
  click_button "Log in"
end
