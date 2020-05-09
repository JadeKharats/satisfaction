class Questionnaire < BaseModel
  table do
    column session_id : Int64
    column stagiaire_nom : String
    column stagiaire_fonction : String
    column orga_accueil : Int16
    column orga_salle_formation : Int16
    column orga_moyens_technique : Int16
    column orga_comment : String
    column animateur_maitrise : Int16
    column animateur_qualite_communiquant : Int16
    column animateur_ecoute : Int16
    column animateur_dispo : Int16
    column animateur_comment : String
    column cours_richesse : Int16
    column cours_exemple : Int16
    column cours_qualite_doc : Int16
    column cours_clarte : Int16
    column cours_comment : String
    column globale_rythme : Int16
    column globale_respect_plan : Int16
    column globale_atteinte_objectif : Int16
    column globale_note : Int16
    column global_comment_positif : String
    column globale_comment_dix : String
    column globale_attente : Bool
  end
end
