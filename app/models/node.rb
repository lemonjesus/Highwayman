class Node < ActiveRecord::Base
    self.table_name = :planet_osm_nodes

    def self.[](id)
        find_by_id(id)
    end

    # TODO: this is a horrible way to do this, I need to add an actual point to the Node model
    def self.find_nearest(lat, lon)
        Node.select("abs(#{lat}-lat)::bigint*abs(#{lat}-lat)::bigint+abs(#{lon}-lon)::bigint*abs(#{lon}-lon)::bigint as diff, *").order("diff").first
    end

    def ways
        Way.where("nodes @> ?", "{#{id}}")
    end

    def relations
        Relation.where("parts @> ?", "{#{id}}")
    end
end