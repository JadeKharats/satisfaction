class Participants::ShowPage < MainLayout
  needs participant : Participant
  quick_def page_title, "Participant with id: #{@participant.id}"

  def content
    link "Back to all Participants", Participants::Index
    h1 "Participant with id: #{@participant.id}"
    render_actions
    render_participant_fields
  end

  def render_actions
    section do
      link "Edit", Participants::Edit.with(@participant.id)
      text " | "
      link "Delete",
        Participants::Delete.with(@participant.id),
        data_confirm: "Are you sure?"
    end
  end

  def render_participant_fields
    ul do
      li do
        text "prenom: "
        strong @participant.prenom.to_s
      end
      li do
        text "nom: "
        strong @participant.nom.to_s
      end
      li do
        text "code: "
        strong @participant.code.to_s
      end
      li do
        text "session_id: "
        strong @participant.session_id.to_s
      end
    end
  end
end
