Given('I have supporter levels called Bronze, Silver and Gold') do
  SupporterLevel.create(name: "Bronze", amount: "5.00", description: "My awesome supporter level")
  SupporterLevel.create(name: "Silver", amount: "10.00", description: "My awesome supporter level")
  SupporterLevel.create(name: "Gold", amount: "15.00", description: "My awesome supporter level")
end

When('I fill in card details') do
	# sleep 60
	frame = find('#card-element > div > iframe')
	Capybara.within_frame(frame) do
    fill_in "Card number", :with => "4000008260000000"
    fill_in 'CVC', :with => '123'
    fill_in 'exp-date', :with => '11/22'
		fill_in 'Postcode', :with => 'QW12QW'
  end
end
