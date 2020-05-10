class CreateParticipants::V20200510082218 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Participant) do
      primary_key id : Int64
      add_timestamps
      add prenom : String
      add nom : String
      add code : String
      add session_id : Int64
    end
  end

  def rollback
    drop table_for(Participant)
  end
end
