require 'rails_helper'

describe "User visits a snacks show page" do
  it "they see all the snacks information" do
    owner = Owner.create(name: "Person")
    machine = Machine.create(location: "Place", owner: owner)
    snack1 = machine.snacks.create(name: "Delicious Treat", price: 1)
    snack2 = machine.snacks.create(name: "Deliciouser Treat", price: 5)
    snack3 = machine.snacks.create(name: "Deliciouserer Treat", price: 10)
    machine2 = Machine.create(location: "Different Place", owner: owner, snacks: [snack1, snack2, snack3])

    visit snack_path(snack1)

    expect(page).to have content(snack1.name)
    expect(page).to have content(snack1.price)
    expect(page).to have content(machine.location)
    expect(page).to have content(machine2.location)
  end
end



# As a user
# When I visit a specific snack page
# I see the name of that snack
# I see the price for that snack
# I see a list of locations with vending machines that carry that snack
# I see the average price for snacks in those vending machines
# And I see a count of the different kinds of items in that vending machine.

