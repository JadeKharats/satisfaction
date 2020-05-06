class Sessions::EditPage < MainLayout
  needs operation : SaveSession
  needs session : Session
  quick_def page_title, "Modification de la session #{@session.intitule}"

  def content
    h1 "Modification de la session #{@session.intitule}"
    render_session_form(@operation)
  end

  def render_session_form(op)
    form_for Sessions::Update.with(@session.id) do
      # Edit fields in src/components/sessions/form_fields.cr
      mount Sessions::FormFields.new(op)

      submit "Mettre à jour", data_disable_with: "Mise à jour..."
    end
  end
end
