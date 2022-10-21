class Way < ActiveRecord::Base
    self.table_name = :planet_osm_ways

    def self.[](id)
        find_by_id(id)
    end

    def nodes
        super.map { |n| Node[n] }
    end

    def relations
        Relation.where("parts @> ?", "{#{id}}")
    end
end