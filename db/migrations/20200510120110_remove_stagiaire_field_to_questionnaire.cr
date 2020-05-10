class RemoveStagiaireFieldToQuestionnaire::V20200510120110 < Avram::Migrator::Migration::V1
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
      remove :stagiaire_nom
      remove :stagiaire_fonction
    end
  end

  def rollback
    alter table_for(Questionnaire) do
      add stagiaire_nom : String, fill_existing_with: :nothing
      add stagiaire_fonction : String, fill_existing_with: :nothing
    end
  end
end
