#declare PyYellow = color rgb <1.,.87,.31>; // #ffde4f
#declare PyBlue = color rgb <.21,.46,.67>; // #3776ab

global_settings {
  assumed_gamma 1.5
  ambient_light 5
}

// square viewport
camera {
  location <0, 0, -8.5>
  up y
  right x
  look_at <0, 0, 0>
  blur_samples 10
}

#declare Tube = union {
  difference{
    torus { 2, 1 rotate x*-90 }
    box { <-4, -4, -1>, <4, 0, 1> }
  }
  cylinder { <-2, 0, 0>, <-2, -2, 0>, 1 }
  cylinder { <2, 0, 0>, <2, -2, 0>, 1 }
  sphere { <-2, -2, 0>, 1 }
  sphere { <2, -2, 0>, 1 }
  translate x*-1
  translate y*+1
}

// the yellow N
object { Tube
  texture {
    pigment { PyYellow }
  }
}

// the blue U
object { Tube
  rotate z*180
  texture {
    pigment { PyBlue } 
  }
}

// yellow illumination from upper left
light_source {
  <-8.658, 5, 0>
  PyYellow
  parallel
  point_at <0,0,0>
}

// blue illumination from lower right
light_source {
  <8.658, -5, 0>
  PyBlue
  parallel
  point_at <0,0,0>
}

// mild white illumination from front
light_source {
  <0, 0, -5>
  color .5
  parallel
  point_at <0,0,0>
}
