[Mesh]
  type = GeneratedMesh
  dim = 2
  xmin = 0.0
  xmax = 1.0
  ymin = 0.0
  ymax = 1.0
  nx = 5
  ny = 5
[]

[Variables]
  [T]
  []
[]

[Functions]
  [heat_source]
    type = ParsedFunction
    value = 'sin(x / 0.1) * cos(y / 0.1) * 1e6'
  []
[]

[Kernels]
  [diffusion]
    type = Diffusion
    variable = T
  []
  [source]
    type = BodyForce
    variable = T
    function = heat_source
  []
[]

[BCs]
  [all]
    type = DirichletBC
    variable = T
    boundary = 'left right bottom top'
    value = 100.0
  []
[]

[Executioner]
  type = Steady
[]

[Postprocessors]
  [max_T]
    type = ElementExtremeValue
    variable = T
  []
[]

[Outputs]
  exodus = true
[]
