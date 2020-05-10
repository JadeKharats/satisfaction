class Guest::Participant::IndexPage < AuthLayout
  needs participant_id : Int64
  needs operation : SaveQuestionnaire
  def content
    form_for Guest::Questionnaire::Create do

      hidden_input(operation.participant_id, value: participant_id)

      tag "section", class: "section" do
        div class: "container" do
          h1 "L’organisation", class: "title"
          render_star("orga_accueil", "Accueil")
          render_star("orga_salle_formation", "Salle de formation")
          render_star("orga_moyens_technique", "Moyens techniques")
          mount Shared::Field.new(operation.orga_comment, "Commentaire"), &.textarea(rows: "6")
        end
      end

      tag "section", class: "section has-background-grey-lighter" do
        div class: "container" do
          h1 "L’animateur", class: "title"
          render_star("animateur_maitrise", "Maitrise Technique")
          render_star("animateur_qualite_communiquant", "Qualité de communiquant")
          render_star("animateur_ecoute", "Capacité d’écoute")
          render_star("animateur_dispo", "Disponibilité")
          mount Shared::Field.new(operation.animateur_comment, "Commentaire"), &.textarea(rows: "6")
        end
      end

      tag "section", class: "section" do
        div class: "container" do
          h1 "Le cours", class: "title"
          render_star("cours_richesse", "Richesse du cours")
          render_star("cours_exemple", "Exemples/Exercices")
          render_star("cours_qualite_doc", "Qualité de la documentation")
          render_star("cours_clarte", "Clarté et synthèse")
          mount Shared::Field.new(operation.cours_comment, "Commentaire"), &.textarea(rows: "6")
        end
      end

      tag "section", class: "section has-background-grey-lighter" do
        div class: "container" do
          h1 "Evaluation globale", class: "title"
          render_star("globale_rythme", "Rythme de la formation")
          render_star("globale_respect_plan", "Respect du plan de cours")
          render_star("globale_atteinte_objectif", "Atteinte des objectifs fixés")
        end
      end

      tag "section", class: "section" do
        div class: "container" do
          h1 "Résumé", class: "title"
          render_star("globale_note", "Globalement, quel est votre niveau de satisfaction à l’égard de cette formation ?")
          mount Shared::Field.new(operation.global_comment_positif, "Pour vous, quels sont les éléments positifs justifiant cette note ?"), &.textarea(rows: "6")
          mount Shared::Field.new(operation.globale_comment_dix, "J’aurais mis 10 si "), &.textarea(rows: "6")
          div class: "field" do
            tag "label", class: "checkbox" do
              text "la formation a répondu à vos attentes"
              checkbox(operation.globale_attente)
            end
          end
        end
      end

      submit "Valider mon enquête",
        data_disable_with: "Validation ....",
        class: "button is-link is-fullwidth"
    end

  end

  private def render_star(attribute, label)
    div class: "field" do
      tag "label", class: "label" do
        text label
      end
      div class: "control" do
        div class: "stars" do
          input(type: "radio", class:  "star star-5", name: "questionnaire:#{attribute}", id: "#{attribute}-star-5", value: 5)
          raw "<label class=\"star star-5\" for=\"#{attribute}-star-5\"></label>"
          input(type: "radio", class:  "star star-4", name: "questionnaire:#{attribute}", id: "#{attribute}-star-4", value: 4)
          raw "<label class=\"star star-4\" for=\"#{attribute}-star-4\"></label>"
          input(type: "radio", class:  "star star-3", name: "questionnaire:#{attribute}", id: "#{attribute}-star-3", value: 3)
          raw "<label class=\"star star-3\" for=\"#{attribute}-star-3\"></label>"
          input(type: "radio", class:  "star star-2", name: "questionnaire:#{attribute}", id: "#{attribute}-star-2", value: 2)
          raw "<label class=\"star star-2\" for=\"#{attribute}-star-2\"></label>"
          input(type: "radio", class:  "star star-1", name: "questionnaire:#{attribute}", id: "#{attribute}-star-1", value: 1)
          raw "<label class=\"star star-1\" for=\"#{attribute}-star-1\"></label>"
        end
      end
    end
  end


end
