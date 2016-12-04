
/*Breackwater pize called Dolo
    Author : Miguel Molinos
    Date : 11/08/2016
*/
module dolo(H1 = 10, H2 = 7, R1 = 3, R2 = 2){


    /*Parámetros de diseño*/

    a = 2*R1*sin(45/2);

    /*Dolo*/ 
    rotate([0,0,-22.5])    
    union(){
    
        union(){    
        /*Pieza central*/
        cylinder(r=R1,h=H1,$fn=8,center=true);
        /*Galleta inferior*/
        rotate([90,0,22.5+90])
            translate([0,-5,0])
                rotate([0,0,22.5])
                    cylinder(r=R1,h=a,$fn=8,center=true);  
        /*Galleta superior*/
        rotate([90,0,22.5])
            translate([0,5,0])
                rotate([0,0,22.5])
                    cylinder(r=R1,h=a,$fn=8,center=true);    
                
        }

        /*Pieza superior*/
        union(){
            for (k=[0,180]){
                rotate([90,0,22.5+k])
                    translate([0,5,a/2])
                        rotate([0,0,22.5])
                            cylinder(r1=R1, r2=R2 ,h=H2,$fn=8); 
            }
        }

        /*Pieza inferior*/
        union(){
            for (k=[90,270]){
                rotate([90,0,22.5+k])
                    translate([0,-5,a/2])
                        rotate([0,0,22.5])
                            cylinder(r1=R1, r2=R2 ,h=H2,$fn=8); 
            }
        }

    }
}




dolo();