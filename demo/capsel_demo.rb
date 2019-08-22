class User
  attr_reader :first_name, :last_name, :marriage_partner
  attr_writer :marriage_partner

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def add(marriage_partner)
    @marriage_partner = marriage_partner
  end

  def marriage
    @marriage_partner
  end
end

users = []
users << User.new('Abe', 'Akio')
users << User.new('Ito', 'Ikuo')
p users

users[0].add(User.new('Abe', 'Akiko'))
p users[0]
p users[0].marriage_partner
p "#{users[0].marriage_partner.first_name} #{users[0].marriage_partner.last_name}"

p users[0].marriage
p users[1].marriage.nil?
users[1].marriage_partner = nil
p users[0]

users = Array.new(2) { Array.new(3, '') }
p users


# users.each.with_index do |y, y_index|
#   y.each.with_index do |x, x_index|
#     users[y_index][x_index] = User.new('Umezawa', 'Tomio')
#   end
# end
# p users