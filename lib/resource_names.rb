module ResourceNames
    

    def casting_name
        self.casting_office.name
    end

    def project_name
        self.project.name
    end

    def actor_name
        self.actor.first_name.capitalize + " " + self.actor.last_name.capitalize
    end

end