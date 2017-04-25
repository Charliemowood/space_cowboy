require 'pg'
class Bounty

  attr_accessor :name, :species, :bounty_value, :favourite_weapon
  attr_reader :id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @species = params['species']
    @bounty_value = params['bounty_value']
    @favourite_weapon = params['favourite_weapon']
  end

  def Bounty.all()
    db = PG.connect({ dbname: 'bounty_hunter', host: 'localhost'})
    sql = "SELECT * FROM bounty;"
    result = db.exec(sql)
    db.close()
    return result.map {|bounty_hash| Bounty.new(bounty_hash)}
  end

  def save()
    db = PG.connect({ dbname: 'bounty_hunter', host: 'localhost'})
    sql = "INSERT INTO bounty 
    (name, species, bounty_value, favourite_weapon) 
    VALUES
    ('#{@name}','#{@species}', #{@bounty_value}, '#{@favourite_weapon}')
    RETURNING *;"
    @id = db.exec(sql).first()['id'].to_i
    db.close()
  end

  def delete()
    db = PG.connect({ dbname: 'bounty_hunter', host: 'localhost'})
    sql = "DELETE FROM bounty WHERE id = #{@id}"
    db.exec(sql)
    db.close()
  end

  def Bounty.delete_all()
    db = PG.connect({ dbname: 'bounty_hunter', host: 'localhost'})
    sql = "DELETE FROM bounty;"
    db.exec(sql)
    db.close()
  end

  def update()
    db = PG.connect({ dbname: 'bounty_hunter', host: 'localhost'})
    sql = "UPDATE bounty SET (name, species, bounty_value, favourite_weapon) =
          ('#{@name}', '#{@species}', #{@bounty_value}, '#{@favourite_weapon}')
          WHERE id = #{@id};"
    db.exec(sql)
    db.close()
  end

  def Bounty.find(identity)
    db = PG.connect({ dbname: 'bounty_hunter', host: 'localhost'})
    sql = "SELECT * FROM bounty WHERE id = #{identity}"
    result = db.exec(sql)
    db.close()
    return Bounty.new(result.first)
  end

end