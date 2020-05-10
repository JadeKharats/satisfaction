class Participants::NewPage < MainLayout
  needs operation : SaveParticipant
  quick_def page_title, "New Participant"

  def content
    h1 "New Participant"
    render_participant_form(@operation)
  end

  def render_participant_form(op)
    form_for Participants::Create do
      # Edit fields in src/components/participants/form_fields.cr
      mount Participants::FormFields.new(op)

      submit "Save", data_disable_with: "Saving..."
    end
  end
end
