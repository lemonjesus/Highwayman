class Node < ActiveRecord::Base
    self.table_name = :planet_osm_nodes

    def self.[](id)
        find_by_id(id)
    end

    def ways
        Way.where("nodes @> ?", "{#{id}}")
    end

    def relations
        Relation.where("parts @> ?", "{#{id}}")
    end
end