class Sessions::IndexPage < MainLayout
  needs sessions : SessionQuery
  quick_def page_title, I18n.t("sessions.index.title")

  def content
    h1 I18n.t("sessions.index.title")
    render_sessions
  end

  def render_sessions
    @sessions.each do |session|
      div class: "card" do
        link "#{session.complete_name} ( #{I18n.t("sessions.index.attendees", count: session.participants.size)} )", Sessions::Show.with(session)
      end
    end
  end
end
