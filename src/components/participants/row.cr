class Participants::Row < BaseComponent
  needs participant : Participant

  def render
    div class: "columns" do
      div class: "column is-half" do
        text "#{participant.complete_name}"
      end
      div class: "column" do
        text "#{participant.code}"
      end
      div class: "column" do
        div class: "field has-addons" do
          tag "p", class: "control" do
            link "Modifier", Participants::Edit.with(participant.id), class: "button is-primary"
          end
          tag "p", class: "control" do
            link "Supprimer", Participants::Delete.with(participant.id), class: "button is-danger"
          end
        end
      end
    end
  end
end
