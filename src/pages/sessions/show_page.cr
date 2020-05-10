class Sessions::ShowPage < MainLayout
  needs session : Session
  quick_def page_title, "#{@session.intitule}"

  def content
    render_formation_informations
    render_participants_informations
  end

  private def render_participants_informations
    div(class: "card") do
      render_participants_header
      render_participants_content
      render_participants_footer
    end
  end

  private def render_participants_content
    div class: "card-content" do
      div class: "content" do
        div class: "columns" do
          div class: "column is-half" do
            strong "Nom complet"
          end
          div class: "column" do
            strong "Code individuel"
          end
          div class: "column" do
            strong "Actions"
          end
        end
        @session.participants.each do |participant|
          mount Participants::Row.new(participant)
        end
      end
    end
  end

  private def render_participants_footer
    tag("footer", class: "card-footer") do
      link I18n.t("sessions.show.attendees.add"),
        Participants::New.with(session_id: @session.id),
        class: "card-footer-item"
    end

  end

  private def render_participants_header
    tag("header", class: "card-header") do
      tag("p", class: "card-header-title") do
        text I18n.t("sessions.show.attendees.title")
      end
    end
  end

  private def render_formation_informations
    div(class: "card") do
      render_header
      render_content
      render_footer
    end
  end

  private def render_header
    tag("header", class: "card-header") do
      tag("p", class: "card-header-title") do
        text "#{@session.intitule}"
      end
    end
  end

  private def render_content
    div class: "card-content" do
      div class: "content" do
        render_session_fields
      end
    end
  end

  private def render_footer
    tag("footer", class: "card-footer") do
      link I18n.t("sessions.show.session.edit"),
        Sessions::Edit.with(@session.id),
        class: "card-footer-item"
      link I18n.t("sessions.show.session.delete"),
        Sessions::Delete.with(@session.id),
        data_confirm: "Are you sure?",
        class: "card-footer-item"
    end
  end

  def render_session_fields
    mount Sessions::Information::Row.new("sessions.show.session.details.professor", @session.formateur)
    mount Sessions::Information::Row.new("sessions.show.session.details.begin_date", @session.format_begin_date)
    mount Sessions::Information::Row.new("sessions.show.session.details.end_date", @session.format_end_date)
    mount Sessions::Information::Row.new("sessions.show.session.details.uid", @session.uid)
  end
end
