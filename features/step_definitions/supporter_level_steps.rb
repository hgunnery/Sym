Given('I have supporter levels called Bronze, Silver and Gold') do
  SupporterLevel.create(name: "Bronze", ammount: "5.00")
  SupporterLevel.create(name: "Silver", ammount: "10.00")
  SupporterLevel.create(name: "Gold", ammount: "15.00")
end
