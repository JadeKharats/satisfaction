class ChangeRelationToQuestionnaire::V20200510120906 < Avram::Migrator::Migration::V1
  def migrate
    # Read more on migrations
    # https://www.luckyframework.org/guides/database/migrations
    #
    # create table_for(Thing) do
    #   primary_key id : Int64
    #   add_timestamps
    #
    #   add title : String
    #   add description : String?
    # end

    # Run custom SQL with execute
    #
    # execute "CREATE UNIQUE INDEX things_title_index ON things (title);"
    alter table_for(Questionnaire) do
      remove :session_id
      add participant_id : Int64, fill_existing_with: :nothing
    end
  end

  def rollback
    alter table_for(Questionnaire) do
      remove :participant_id
      add session_id : Int64, fill_existing_with: :nothing
    end
  end
end
