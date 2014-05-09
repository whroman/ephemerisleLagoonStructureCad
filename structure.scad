red = [1,0,0, 0.7];
green = [0,1,0, 0.7];
blue = [0,0,1, 0.7];

base = 0;
base3d = [base, base, base];
lenA = 106;
lenB = 150;
lenC = 184;

scaleBy = 0.67;
scale3d = [scaleBy, scaleBy, scaleBy];

// Modules
triFace = [0, 1, 2];
quadFace = [0, 1, 2, 3];
module triangle(points, color=[0,0,0]) {
    color(color) {
        polyhedron(points, [triFace]);
    }
}

module quad(points, color=[0,0,0]) {
    color(color) {
        polyhedron(points, [quadFace]);
    }
}

// Rendering
tri1APoints = [
    [base, base, lenA],
    [base, base, lenA * 1.5], 
    [base, lenB/2, lenA * 1.5],
    [base, lenB, lenA],
];

tri1BPoints = [
    [base, base, lenA], 
    [base, base, lenA * 1.5], 
    [lenB/2, base, lenA * 1.5],
    [lenB, base, lenA],
];

tri1CPoints = [
    [base, base, lenA * 1.5], 
    [base, base, lenA * 2], 
    [base, lenB/2, lenA * 1.5]
];

tri1DPoints = [
    [base, base, lenA * 1.5], 
    [base, base, lenA * 2], 
    [lenB/2, base, lenA * 1.5],
];

tri2APoints = [
    [lenB, base, base], 
    [lenB, base, lenA], 
    [lenB, lenB, base],
];

tri2BPoints = [
    [base, lenB, base], 
    [base, lenB, lenA], 
    [lenB, lenB, base],
];

rect1APoints = [
    base3d, 
    [base, base, lenA], 
    [base, lenB, lenA],
    [base, lenB, base],
];

rect1BPoints = [
    base3d, 
    [base, base, lenA], 
    [lenB, base, lenA],
    [lenB, base, base],
];

// Rendering
scale(v=scale3d) {
rotate(a=[35,150, -78.75]) {
translate([-lenB,-lenB,0]) {
        quad(rect1APoints, red);
        quad(rect1BPoints, red);

        // triangle(tri1CPoints);
        // triangle(tri1DPoints);

        quad(tri1APoints, green);
        quad(tri1BPoints, green);

        triangle(tri2APoints, blue);
        triangle(tri2BPoints, blue);

}}}


// Pool
translate([-lenA * scaleBy , -lenA * scaleBy]) {
    cylinder(h=1, r = 40);
}


// Water - XY Plane
lenWater = 150;
colorWater = [0.2,0.8,1];
water = [
    [lenWater,lenWater],
    [-lenWater, lenWater],
    [-lenWater,-lenWater],
    [lenWater,-lenWater],
];

quad(water, colorWater);



