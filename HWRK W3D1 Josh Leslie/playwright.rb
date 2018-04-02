class Playwright
  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM Play")
    data.map {|dat| Playwright.new(dat)}
  end

  def self.find_by_name(name)
    person = PlayDBConnection.instance.execute(<<-SQL, name)

      SELECT
        *
      FROM
        playwrights
      WHERE
        name = ?

    SQL

    return nil unless person.count > 0 # person is stored in an array!

    Playwright.new(person.first)
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)

      INSERT INTO
        plays (name, birth_year)
      VALUES
        (?, ?)

    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL,  @name, @birth_year, @id)

      UPDATE
        plays
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?

    SQL
  end

  def get_plays
    # returns all plays written by self
    raise "#{self} not in database" unless @id
    plays = PlayDBConnection.instance.execute(<<-SQL, @id)

      SELECT
        *
      FROM
        plays
      WHERE
        playwright_id = ?

    SQL

    plays.map { |play| Play.new(play) }
  end
end
