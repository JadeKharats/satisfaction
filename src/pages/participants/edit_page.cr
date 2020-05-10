class Participants::EditPage < MainLayout
  needs operation : SaveParticipant
  needs participant : Participant
  quick_def page_title, "Edit Participant with id: #{@participant.id}"

  def content
    link "Back to all Participants", Participants::Index
    h1 "Edit Participant with id: #{@participant.id}"
    render_participant_form(@operation)
  end

  def render_participant_form(op)
    form_for Participants::Update.with(@participant.id) do
      # Edit fields in src/components/participants/form_fields.cr
      mount Participants::FormFields.new(op)

      submit "Update", data_disable_with: "Updating..."
    end
  end
end
