# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
churches = [{ name: '內壢' }, { name: '三重' }, { name: '汐止' }, { name: '永康' }]

Church.create(churches)
user = User.new(name: 'King', date_of_birth: '2000-05-06', line_id: 'U8494498a03acd3ede5951b3d51487e59',
                gender: 'male', church_name: '內壢')
user.save!
