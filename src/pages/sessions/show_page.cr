class Sessions::ShowPage < MainLayout
  needs session : Session
  quick_def page_title, "Session with id: #{@session.id}"

  def content
    link "Back to all Sessions", Sessions::Index
    h1 "Session with id: #{@session.id}"
    render_actions
    render_session_fields
  end

  def render_actions
    section do
      link "Edit", Sessions::Edit.with(@session.id)
      text " | "
      link "Delete",
        Sessions::Delete.with(@session.id),
        data_confirm: "Are you sure?"
    end
  end

  def render_session_fields
    ul do
      li do
        text "formateur: "
        strong @session.formateur.to_s
      end
      li do
        text "begin_date: "
        strong @session.begin_date.to_s
      end
      li do
        text "end_date: "
        strong @session.end_date.to_s
      end
      li do
        text "intitule: "
        strong @session.intitule.to_s
      end
      li do
        text "uid: "
        strong @session.uid.to_s
      end
    end
  end
end
