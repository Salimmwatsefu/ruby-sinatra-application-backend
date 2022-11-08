# This will delete any existing rows from the Product and User tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting old data..."
Product.destroy_all

puts "🌱 Seeding data..."

# place your seeds here

#product dummy data
Product.create(
    name: "Samsung",
    price: 20,
    description: "Note Series"
)

Product.create(
    name: "Iphone 13",
    price: 50,
    description: "256 GB"
)

Product.create(
    name: "Iphone 29",
    price: 1050,
    description: "3 TB"
)


puts "🌱 Done seeding!"
