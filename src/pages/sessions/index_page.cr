class Sessions::IndexPage < MainLayout
  needs sessions : SessionQuery
  quick_def page_title, "All Sessions"

  def content
    h1 "All Sessions"
    link "New Session", to: Sessions::New
    render_sessions
  end

  def render_sessions
    ul do
      @sessions.each do |session|
        li do
          link session.formateur, Sessions::Show.with(session)
        end
      end
    end
  end
end
