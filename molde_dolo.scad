use <./dolo.scad>

/*Medidas dolo

medidas_dolo = [H1, H2, R1, R2]

*/
H1 = 10;
H2 = 7;
R1 = 3;
R2 = 2;

medidas_dolo = [H1, H2, R1, R2];


/*Medidas cubo

cuboA = [X,Y,Z];

*/

arista_x = medidas_dolo[0]+1;
arista_y = medidas_dolo[0]*2.5;
arista_z = medidas_dolo[0]*2.5;

cuboA = [arista_x,arista_y,arista_z];

taladros = 0.5;


/*Pieza1*/

color("gray")
difference(){
    difference(){

        translate([arista_x/2,0,0])
            linear_extrude(cuboA[2],center=true){
                square([cuboA[0],cuboA[1]],center=true);
            }


        dolo(medidas_dolo[0],medidas_dolo[1],medidas_dolo[2],medidas_dolo[3]);
    
    }

    for (k = [10,0,-10]){  
        for (j = [arista_z/2-2.5,-arista_z/2+2.5]){
            translate([-2,k,j])
                rotate([0,90,0])
                    cylinder(r = taladros , h = arista_x + 4 , $fn = 100);
        }
    }
}

