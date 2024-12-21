// Written by Tobias Mädel <t.maedel@alfeld.de>
hole_diameter = 6;
center_diameter = 14.35;
center_radius = center_diameter / 2;
total_diameter = 55.4;

leaf_diameter = 10.6;
leaf_radius = leaf_diameter / 2;
leaf_count = 10;
leaf_rotation = 18;
leaf_circle_center = (total_diameter / 2) - (leaf_diameter / 2);

circle_segments = 360;

difference() {
    union()
    {
        circle(d = center_diameter, $fn=circle_segments);

        for (i=[0:leaf_count - 1])
        {
            rotate([0, 0, i * (360 / leaf_count) + leaf_rotation])
            {
                translate([0, leaf_circle_center, 0]){
                    circle(d = leaf_diameter, $fn=circle_segments);
                };
            };
            
            rotate([0, 0, i * (360 / leaf_count)])
            {
                polygon(
                [
                    [0, 0],
                    [leaf_circle_center - 0.5, -leaf_radius],
                    [leaf_circle_center - 0.5, leaf_radius]
                ]
                );
            };
        };
    }
    circle(d = hole_diameter, $fn=circle_segments);
};


