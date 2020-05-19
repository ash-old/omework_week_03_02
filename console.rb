require('pry')
require_relative('models/property')

house1 = Property.new({
  'address' => '1 Main Street',
  'value' => 50000,
  'number_of_bedrooms' => 2,
  'build' => 'flat'
  })

  house2 = Property.new({
    'address' => '30 High Street',
    'value' => 70000,
    'number_of_bedrooms' => 3,
    'build' => 'house'
    })




house1.save()
house2.save()
binding.pry
nil
