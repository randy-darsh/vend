# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    owner = Owner.create(name: "Person")
    machine = Machine.create(location: "Place", owner: owner)
    snack1 = machine.snacks.create(name: "Delicious Treat", price: 1)
    snack2 = machine.snacks.create(name: "Deliciouser Treat", price: 5)
    snack3 = machine.snacks.create(name: "Deliciouserer Treat", price: 10)
    machine2 = Machine.create(location: "Different Place", owner: owner, snacks: [snack1, snack2, snack3])