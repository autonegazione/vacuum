//NEMA 17 dimensions
	//BODY 
		b_height = 42;
		b_width = 42;
		b_depth = 48;
		b_cylinder_r = 11;
		b_cylinder_depth = 2; 
	//CHAMFER
	//4mm from edge, 45°: square prism width sqrt(2)* half the 
	//sqr diagonal. This will be the subtracted amount per side
		ch_side = sqrt(2)*4;
	//HOLES POSITIONING
		holes_spacing = 31;
		borders = (b_width - holes_spacing)/2;
		h_radius = 1.5;
   //AXIS
		axis_radius = 2.5;

difference() {
	//BODY
		difference() {
			//MAIN BLOCK
			union() { 
				cube([b_width,b_depth,b_height]);
				translate ([b_width/2,0,b_height/2]) rotate([90,0,0]) cylinder(h=b_cylinder_depth,r=b_cylinder_r); 
				}
		//CHAMFER
		for(i = [ [b_width,20,b_height],
			[b_width,20,0],
			[0,20,0],
			[0,20,b_height]])
		
			{translate(i) rotate([90,45,0]) cube([ch_side,ch_side,80],
				center=true);}
			//
		 }
		//
	//HOLES
	for(i=[ [borders,60,borders],
		[borders,60,(borders+holes_spacing)],
		[(borders+holes_spacing),60,(borders+holes_spacing)],
		[(borders+holes_spacing),60,borders] ]) 
	{
		translate(i) rotate([90,0,0]) cylinder(h=80,r=h_radius, $fn=10);
	}
	//AXIS HOLE
	translate([b_width/2,80,b_height/2]) rotate([90,0,0]) cylinder(h=90,r=axis_radius, $fn=10);
	
}
