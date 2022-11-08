# This will delete any existing rows from the Product and User tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting old data..."
Product.destroy_all

puts "🌱 Seeding data..."

# place your seeds here



puts "🌱 Done seeding!"
