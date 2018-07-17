puts "Create User"
user = User.new(email: 'test@ocrreader.com', password: 'password', password_confirmation: 'password')
user.save!
puts "Done"