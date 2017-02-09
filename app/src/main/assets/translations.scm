;; -*- mode: scheme; -*-
;; Farm Crap App Pro Copyright (C) 2016 FoAM Kernow
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU Affero General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU Affero General Public License for more details.
;;
;; You should have received a copy of the GNU Affero General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(define i18n-text
  (list
   (list 'splash-title (list "The Allotment Lab Prototype"))
   (list 'splash-text (list "This is a prototype designed to demonstrate ideas for the Allotment Lab"))
   (list 'splash-blurb (list "Developed by <a href='http://fo.am/kernow'>FoAM Kernow</a> on behalf of the <a href='www.swarmhub.co.uk'>SWARM Knowledge Hub</a>, a Rural Development Programme for England (RDPE) initiative managed by <a href='http://www.duchy.ac.uk/'>Duchy College Rural Business School</a>, in partnership with Rothamsted Research North Wyke."))
   (list 'splash-start (list "Enter the Allotment Lab"))
   (list 'splash-discl (list "The Allotment Lab offers information for guidance purposes only and is not intended to amount to professional advice or opinion. FoAM Kernow, Duchy College, and Rothamsted Research North Wyke cannot be held responsible for any losses or damage resulting from the use of information provided by this app."))

   (list 'title (list "Becky's allotment"))

   (list 'soil-texture (list "Soil texture"))
   (list 'soil-texture-but (list "Sandy loam"))
   (list 'soil-ph (list "Soil pH"))
   (list 'soil-ph-but (list "Slightly acid"))
   (list 'units (list "Choose units"))
   (list 'units-but (list "Metric"))
   (list 'rainfall (list "Rainfall"))
   (list 'rainfall-but (list "Low"))

   (list 'compost-lab (list "Go to my compost lab"))
   (list 'soil-lab (list "Go to my soil lab"))

   (list 'recommended-crops (list "Recommended crops for your soil type"))
   (list 'recommended-crops-text (list "Roots - carrots, parsnips, betroot, fennel, celery, parsley. Alliums - garlic, onion, leeks, shallots, chives."))
   (list 'todo (list "Things to do"))
   (list 'todo-text (list "Plant garlic bulbs now for havesting in summer."))

   (list 'soil-title (list "Soil texture lab"))
   (list 'soil-text (list "Follow this guide to find out your soil texture. This will make it easier to choose suitable plants."))

   (list 'soil-1 (list "Does the soil form a coherent ball?"))
   (list 'easily (list "Easily"))
   (list 'great-care (list "With great care"))
   (list 'no (list "No"))

   (list 'soil-2 (list "What happens when the ball is pressed flat?"))
   (list 'flattens (list "Flattens coherently"))
   (list 'breaks (list "Breaks up"))

   (list 'soil-3 (list "On slight further moistening, can the ball be rolled into a cylinder 5mm thick?"))
   (list 'yes (list "Yes"))

   (list 'soil-4 (list "Can the cylinder be bent into a horseshoe without cracking?"))
   
   (list 'soil-5 (list "On remodelling with further moisture, what is the general feel of the soil?"))
   (list 'smooth (list "Smooth and pasty"))
   (list 'rough (list "Rough and abrasive"))

   (list 'soil-6 (list "Can a ring be formed by joining the two ends of the cylinder, without it cracking?"))

   (list 'soil-7 (list "On remodelling with further water, what is the general feel of the soil?"))
   (list 'gritty (list "Very gritty"))
   (list 'mod-rough (list "Moderately rough"))
   (list 'doughy (list "Doughy"))

   (list 'soil-8 (list "On remodelling without further wetting, can the surface be polished with the thumb?"))
   (list 'polish-yes (list "Yes, a high polish with few noticable particles"))
   (list 'polish-gritty (list "Yes, but gritty particles really noticable"))

   (list 'soil-9 (list "On wetting thoroughly, how strongly does the soil stick your fingers together?"))
   (list 'very-strongly (list "Very strongly"))
   (list 'moderately (list "Moderately"))

   (list 'your-soil (list "Your allotment soil is:"))
   (list 'done (list "Done"))
   (list 'restart (list "Start again"))

   (list 'compost-title (list "Compost Lab"))
   (list 'compost-text (list "Your compost bins"))
   (list 'new-bin (list "Add new bin"))
   (list 'left-bin (list "Left bin"))
   (list 'middle-bin (list "Middle bin"))
   (list 'right-bin (list "Right bin"))
   (list 'compost-tips (list "Composting tips"))
   (list 'compost-troubleshooting (list "Compost troubleshooting"))
   (list 'compost-type (list "Types of compost bin"))
   (list 'compost-what (list "What can be composted"))
   (list 'compost-maintenance (list "Compost maintenance"))
   (list 'compost-using (list "Using compost"))
   (list 'back (list "Back"))

   (list 'bin-title (list "Left bin"))
   (list 'add-material (list "Add to compost"))
   (list 'bin-text (list "The ideal Carbon:Nitrogen ratio of compost is 30. About two thirds of Carbon is lost as Carbon Dioxide through the composting process."))
   (list 'bin-ratio (list "Current approximate Carbon:Nitrogen ratio of your compost"))
   (list 'ratio-but (list "<b>300</b>"))
   (list 'bin-ratio2 (list "Approximate Carbon:Nitrogen ratio of your compost once it has fully composted"))
   (list 'ratio-but2 (list "<b>100</b>"))
   (list 'bin-tip (list "To improve your compost"))
   (list 'bin-info (list "Add more green material like kitchen waste, leafy plant matter of grass clippings."))
   
   (list 'add-title (list "Add material to left bin"))
   (list 'add-text (list "Use a jam jar or bucket to measure the amount of material added. The size doesn't matter as long as the amount is reasonably consistent."))
   (list 'add-mat-text (list "Material added"))
   (list 'add-mat-but (list "Paper"))
   (list 'add-containers-text (list "Number of containers full"))
   (list 'add-containers-but (list "0.5"))
   (list 'add-ratio (list "Carbon:Nitrogen ratio of this material"))
   (list 'add-ratio-amount (list "<b>300</b>"))
   (list 'save (list "Save"))
   (list 'cancel (list "Cancel"))

   (list 'trouble-title (list "Compost troubleshooting"))
   (list 'trouble-text (list "Follow this guide to identify composting problems and solutions."))

   (list 'compost-1 (list "Is your compost wet, slimy or strong smelling?"))
   (list 'compost-2 (list "Is your compost dry or fibrous with little rotting?"))
   (list 'compost-3 (list "Is your compost dry or fibrous with little rotting throughout?"))
   (list 'compost-4 (list "Is your compost dry or fibrous with little rotting around the edges, but otherwise Ok?"))
   (list 'compost-5 (list "Is your compost dry or fibrous with little rotting on the top, but otherwise Ok?"))
   (list 'compost-6 (list "Do you have a problem with flies or rats?"))
   
   (list 'rats (list "Rats"))
   (list 'flies (list "Flies"))
   
   (list 'problem (list "Problem identified"))
   (list 'solution (list "Suggested solution"))
   ))
