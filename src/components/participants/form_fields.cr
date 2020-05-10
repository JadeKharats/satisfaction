class Participants::FormFields < BaseComponent
  needs operation : SaveParticipant

  def render
    mount Shared::Field.new(operation.prenom), &.text_input(autofocus: "true")
    mount Shared::Field.new(operation.nom)
    mount Shared::Field.new(operation.session_id) do |input_html|
      input_html.select_input append_class: "select-input" do
        options_for_select operation.session_id, options_for_sessions
      end
    end
  end

  private def options_for_sessions
    SessionQuery.all.map do |session|
      {session.complete_name, session.id}
    end
  end
end
