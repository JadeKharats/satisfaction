class CreateSessions::V20200506110011 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Session) do
      primary_key id : Int64
      add_timestamps
      add formateur : String
      add begin_date : Time
      add end_date : Time
      add intitule : String
      add uid : Int16
    end
  end

  def rollback
    drop table_for(Session)
  end
end
