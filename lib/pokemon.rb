class Pokemon
  attr_accessor :name, :type, :id, :db

  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.find(id_num, db)
    sql = 'SELECT * from pokemon WHERE id = ?'
    info = db.execute(sql, id_num).flatten
    new(id: info[0], name: info[1], type: info[2], db: db)
  end

  def self.save(name, type, db)
    sql = 'INSERT INTO pokemon (name, type) VALUES (?, ?)'
    db.execute(sql, name, type)
  end
end
