5.times do |a|
  Account.create(code: "#{a}code", name: "Account-#{a}", description: "This is #{a}", debit: "", credit: "")
end
