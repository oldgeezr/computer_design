
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name ex0 -dir "/opt/dmlab/home/chriram/Documents/computer_design/ex0/planAhead_run_1" -part xc6slx16csg324-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/opt/dmlab/home/chriram/Documents/computer_design/ex0/stack.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/opt/dmlab/home/chriram/Documents/computer_design/ex0} }
set_param project.paUcfFile  "stack.ucf"
add_files "stack.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design
