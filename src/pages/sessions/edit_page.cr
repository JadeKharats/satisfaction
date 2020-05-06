class Sessions::EditPage < MainLayout
  needs operation : SaveSession
  needs session : Session
  quick_def page_title, "Edit Session with id: #{@session.id}"

  def content
    link "Back to all Sessions", Sessions::Index
    h1 "Edit Session with id: #{@session.id}"
    render_session_form(@operation)
  end

  def render_session_form(op)
    form_for Sessions::Update.with(@session.id) do
      # Edit fields in src/components/sessions/form_fields.cr
      mount Sessions::FormFields.new(op)

      submit "Update", data_disable_with: "Updating..."
    end
  end
end
