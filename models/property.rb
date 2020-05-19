require ('pg')


class Property

  attr_reader :id
  attr_accessor :address, :value, :number_of_bedrooms, :build

def initialize(specs)
  @id = specs['id'] if specs['id']
  @address = specs['address']
  @value = specs['value']
  @number_of_bedrooms = specs['number_of_bedrooms']
  @build = specs['build']
end


def save()
  db = PG.connect( { dbname: 'property_specs', host: 'localhost'})

  sql = "INSERT INTO property_list(
          address,
          value,
          number_of_bedrooms,
          build)
          VALUES
          ($1, $2, $3, $4)
          RETURNING id"

values = [@address, @value, @number_of_bedrooms, @build]
db.prepare("save", sql)
pg_result = db.exec_prepared("save", values)
@id = pg_result[0]["id"].to_i()

db.close()
end

def update()
  db = PG.connect({dbname: 'property_specs', host: 'localhost'})
  sql = "UPDATE property_list
            SET
            (address,
            value,
            number_of_bedrooms,
            build) =
            ($1, $2, $3, $4)
            WHERE id = $5"
  values = [@address, @value, @number_of_bedrooms, @build, @id]

db.prepare("update", sql)
db.exec_prepared("update", values)
db.close()

end

def delete()
  db = PG.connect({dbname: 'property_specs', host: 'localhost'})

  sql = "DELETE FROM property_list WHERE id = $1"
  values = [@id]

  db.prepare("delete", sql)
  db.exec_prepared("delete", values)

  db.close()

end









end
