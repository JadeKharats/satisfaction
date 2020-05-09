class CreateQuestionnaires::V20200509085409 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Questionnaire) do
      primary_key id : Int64
      add_timestamps
      add session_id : Int64
      add stagiaire_nom : String
      add stagiaire_fonction : String
      add orga_accueil : Int16
      add orga_salle_formation : Int16
      add orga_moyens_technique : Int16
      add orga_comment : String
      add animateur_maitrise : Int16
      add animateur_qualite_communiquant : Int16
      add animateur_ecoute : Int16
      add animateur_dispo : Int16
      add animateur_comment : String
      add cours_richesse : Int16
      add cours_exemple : Int16
      add cours_qualite_doc : Int16
      add cours_clarte : Int16
      add cours_comment : String
      add globale_rythme : Int16
      add globale_respect_plan : Int16
      add globale_atteinte_objectif : Int16
      add globale_note : Int16
      add global_comment_positif : String
      add globale_comment_dix : String
      add globale_attente : Bool
    end
  end

  def rollback
    drop table_for(Questionnaire)
  end
end
