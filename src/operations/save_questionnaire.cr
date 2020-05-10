class SaveQuestionnaire < Questionnaire::SaveOperation
  # To save user provided params to the database, you must permit them
  # https://luckyframework.org/guides/database/validating-saving#perma-permitting-columns
  permit_columns participant_id, orga_accueil, orga_salle_formation, orga_moyens_technique, orga_comment, animateur_maitrise, animateur_qualite_communiquant, animateur_ecoute, animateur_dispo, animateur_comment, cours_richesse, cours_exemple, cours_qualite_doc, cours_clarte, cours_comment, globale_rythme, globale_respect_plan, globale_atteinte_objectif, globale_note, global_comment_positif, globale_comment_dix, globale_attente
end
