module ProjectsHelper

    def start_date(event)
        event.start_date.strftime("Start Date: %B %e, %Y")
    end

end
