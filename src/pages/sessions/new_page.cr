class Sessions::NewPage < MainLayout
  needs operation : SaveSession
  quick_def page_title, "Créer une session"

  def content
    h1 I18n.t("sessions.new.title")
    render_session_form(@operation)
  end

  def render_session_form(op)
    form_for Sessions::Create do
      # Edit fields in src/components/sessions/form_fields.cr
      mount Sessions::FormFields.new(op)

      submit I18n.t("sessions.new.submit"),
        data_disable_with: I18n.t("sessions.new.data_disable_with"),
        class: "button is-link"
    end
  end
end
