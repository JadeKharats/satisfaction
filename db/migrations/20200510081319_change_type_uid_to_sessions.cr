class ChangeTypeUidToSessions::V20200510081319 < Avram::Migrator::Migration::V1
  def migrate
    alter table_for(Session) do
      change_type uid : String
    end
  end

  def rollback
    alter table_for(Session) do
      change_type uid : Int16
    end
  end
end
