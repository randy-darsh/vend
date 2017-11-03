require 'rails_helper'

describe "User visits a vending machines show page" do
  it "they see the name and price of all the snacks that belong to that machine" do
    owner = Owner.create(name: "Person")
    machine = Machine.create(location: "Place", owner: owner)
    machine.snacks.create(name: "Delicious Treat", price: 1)

    visit machine_path(machine)

    expect(page).to have_content("Delicious Treat")
    expect(page).to have_content(1)
  end

  it "they see the average price for all snacks in that machine" do
    owner = Owner.create(name: "Person")
    machine = Machine.create(location: "Place", owner: owner)
    machine.snacks.create(name: "Delicious Treat", price: 1)
    machine.snacks.create(name: "Deliciouser Treat", price: 5)
    machine.snacks.create(name: "Deliciouserer Treat", price: 10)

    visit machine_path(machine)

    expect(page).to have_content("Average Price: 5")
  end
end
