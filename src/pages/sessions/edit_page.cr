class Sessions::EditPage < MainLayout
  needs operation : SaveSession
  needs session : Session
  quick_def page_title, I18n.t("sessions.edit.title")

  def content
    h1 I18n.t("sessions.edit.title")
    render_session_form(@operation)
  end

  def render_session_form(op)
    form_for Sessions::Update.with(@session.id) do
      # Edit fields in src/components/sessions/form_fields.cr
      mount Sessions::FormFields.new(op)

      submit I18n.t("sessions.edit.submit"), data_disable_with: I18n.t("sessions.edit.data_disable_with")
    end
  end
end
