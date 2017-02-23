;; Allotment Lab Prototype Copyright (C) 2017 FoAM Kernow
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

(msg "starwisp.scm")

;(setup-database!)

;;(set-current! 'user-id (get-setting-value "user-id"))
;;(set! i18n-lang (get-setting-value "language"))

(define zoom-out 4)
(define zoom-in 16)
(define centre-layout (layout 'wrap-content 'wrap-content 1 'centre 0))
(define info-col (list #xb0 #xd1 #xc1 #xff))
(define compost-image-height 300)

(define (infotext id)
  (vert-colour 
   info-col
   (text-view (symbol->id id)
	      (mtext-lookup id)
	      large-text-size 
	      (layout 'wrap-content 'wrap-content -1 'centre 20))))

(define (infotext-robin id)
  (linear-layout
   0 'vertical
   (layout 'fill-parent 'wrap-content -1 'centre 0)
   '(0 0 0 0)
   (list
    (vert-colour 
     info-col
     (text-view (symbol->id id)
		(mtext-lookup id)
		large-text-size 
		(layout 'wrap-content 'wrap-content -1 'centre 20)))
    (image-view 0 "speech" (layout 'fill-parent 'wrap-content -1 'centre 0))
    (image-view (make-id "robin") "robin_1" 
		(layout 120 'wrap-content 1 'right 
			'(0 -60 0 0))))))

(define (infotext-forg id)
  (linear-layout
   0 'vertical
   (layout 'fill-parent 'wrap-content -1 'centre 0)
   '(0 0 0 0)
   (list
    (vert-colour 
     info-col
     (text-view (symbol->id id)
		(mtext-lookup id)
		large-text-size 
		(layout 'wrap-content 'wrap-content -1 'centre 20)))
    (image-view 0 "speech2" (layout 'fill-parent 'wrap-content -1 'centre 0))
    (image-view (make-id "forg") "forg_0" 
		(layout 170 'wrap-content 1 'left 
			'(0 -60 0 0))))))

(define (quick-fragment name widgets)
  (fragment
   name
   widgets
   (lambda (fragment arg)
     (activity-layout fragment))
   (lambda (fragment arg)
     (list))
   (lambda (fragment) '())
   (lambda (fragment) '())
   (lambda (fragment) '())
   (lambda (fragment) '())))
  
(define-fragment-list
  (quick-fragment
   "soil-1"
   (vert
    (vert-colour 
     info-col
     (mtitle 'soil-1)
     (image-view (make-id "soil-pic") "soil_1" (layout 'fill-parent 'wrap-content -1 'centre 0)))
    (mbutton 'easily (lambda () (list (replace-fragment (get-id "soil-container") "soil-3"))))
    (mbutton 'great-care (lambda () (list (replace-fragment (get-id "soil-container") "soil-2"))))
    (mbutton 'no (lambda () 
		   (set-current! 'soil-result "Sand")
		   (list (replace-fragment (get-id "soil-container") "soil-end"))))))

  (quick-fragment
   "soil-2"
   (vert
    (vert-colour 
     info-col
     (mtitle 'soil-2)
     (image-view (make-id "soil-pic") "soil_2" (layout 'fill-parent 'wrap-content -1 'centre 0)))
    (mbutton 'flattens (lambda () (list (replace-fragment (get-id "soil-container") "soil-3"))))
    (mbutton 'breaks (lambda () 
		       (set-current! 'soil-result "Sandy loam")
		       (list (replace-fragment (get-id "soil-container") "soil-end"))))))

  (quick-fragment
   "soil-3"
   (vert
    (vert-colour 
     info-col
     (mtitle 'soil-3)
     (image-view (make-id "soil-pic") "soil_3" (layout 'fill-parent 'wrap-content -1 'centre 0)))
    (mbutton 'yes (lambda () (list (replace-fragment (get-id "soil-container") "soil-4"))))
    (mbutton 'no (lambda ()
		   (set-current! 'soil-result "Loamy sand")
		   (list (replace-fragment (get-id "soil-container") "soil-end"))))))

  (quick-fragment
   "soil-4"
   (vert
    (vert-colour 
     info-col
     (mtitle 'soil-4)
     (image-view (make-id "soil-pic") "soil_4" (layout 'fill-parent 'wrap-content -1 'centre 0)))
    (mbutton 'yes (lambda () (list (replace-fragment (get-id "soil-container") "soil-6"))))
    (mbutton 'no (lambda () (list (replace-fragment (get-id "soil-container") "soil-5"))))))
  
  (quick-fragment
   "soil-5"
   (vert
    (vert-colour 
     info-col
     (mtitle 'soil-5)
     (image-view (make-id "soil-pic") "soil_5" (layout 'fill-parent 'wrap-content -1 'centre 0)))
    (mbutton 'smooth (lambda () 
		       (set-current! 'soil-result "Silty loam")
		       (list (replace-fragment (get-id "soil-container") "soil-end")))) 
    (mbutton 'rough (lambda () 
		      (set-current! 'soil-result "Sandy silt loam")
		      (list (replace-fragment (get-id "soil-container") "soil-end"))))))

  (quick-fragment
   "soil-6"
   (vert
    (vert-colour 
     info-col
     (mtitle 'soil-6)
     (image-view (make-id "soil-pic") "soil_6" (layout 'fill-parent 'wrap-content -1 'centre 0)))
    (mbutton 'yes (lambda () (list (replace-fragment (get-id "soil-container") "soil-8"))))
    (mbutton 'no (lambda ()  (list (replace-fragment (get-id "soil-container") "soil-7"))))))

  (quick-fragment
   "soil-7"
   (vert
    (vert-colour 
     info-col
     (mtitle 'soil-7)
     (image-view (make-id "soil-pic") "soil_7" (layout 'fill-parent 'wrap-content -1 'centre 0)))
    (mbutton 'gritty (lambda ()
		       (set-current! 'soil-result "Sandy clay loam")
		       (list (replace-fragment (get-id "soil-container") "soil-end")))) 
    (mbutton 'mod-rough (lambda () 
			  (set-current! 'soil-result "Clay loam")
			  (list (replace-fragment (get-id "soil-container") "soil-end")))) 
    (mbutton 'doughy (lambda () 
		       (set-current! 'soil-result "Silty clay loam")
		       (list (replace-fragment (get-id "soil-container") "soil-end"))))))

  (quick-fragment
   "soil-8"
   (vert
    (vert-colour 
     info-col
     (mtitle 'soil-8)
     (image-view (make-id "soil-pic") "soil_8" (layout 'fill-parent 'wrap-content -1 'centre 0)))
    (mbutton 'polish-yes (lambda () (list (replace-fragment (get-id "soil-container") "soil-9"))))
    (mbutton 'polish-gritty (lambda ()
			      (set-current! 'soil-result "Sandy clay")
			      (list (replace-fragment (get-id "soil-container") "soil-end"))))))

  (quick-fragment
   "soil-9"
   (vert
    (vert-colour 
     info-col
     (mtitle 'soil-9)
     (image-view (make-id "soil-pic") "soil_9" (layout 'fill-parent 'wrap-content -1 'centre 0)))
    (mbutton 'very-strongly (lambda () 
			      (set-current! 'soil-result "Clay")
			      (list (replace-fragment (get-id "soil-container") "soil-end")))) 
    (mbutton 'moderately (lambda () 
			   (set-current! 'soil-result "Silty clay")
			   (list (replace-fragment (get-id "soil-container") "soil-end"))))))

  (fragment
   "soil-end"
   (vert
    (vert-colour 
     info-col
     (mtitle 'your-soil)
     (text-view (symbol->id 'your-soil-result)
		(get-current 'soil-result "No soil result!")
		large-text-size 
		(layout 'wrap-content 'wrap-content -1 'centre 0)))
    
    (mbutton 'done (lambda () (list (finish-activity 1)))) 
    (mbutton 'restart (lambda () (list (replace-fragment (get-id "soil-container") "soil-1")))) 
    )

   (lambda (fragment arg)
     (activity-layout fragment))
   (lambda (fragment arg)
     (list
      (update-widget 'text-view (get-id "your-soil-result") 'text 
		     (string-append "<b>" (get-current 'soil-result "No soil result!") "</b>"))
      ))
   (lambda (fragment) '())
   (lambda (fragment) '())
   (lambda (fragment) '())
   (lambda (fragment) '()))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (quick-fragment
   "compost-1"
   (vert
    (vert-colour 
     info-col
     (mtitle 'compost-1)
     (image-view (make-id "compost-pic") "compost_1" (layout 'fill-parent compost-image-height -1 'centre 0)))
    (mbutton 'yes (lambda () 
		   (set-current! 'compost-problem "There is probably too much water and too little air.")
		   (set-current! 'compost-solutions "(I) Add more brown materials - scrunched paper, card (particularly egg boxes and toilet rolls), or chopped woody material.<br>(II) Cover to keep the compost more dry.")
		   (list (replace-fragment (get-id "compost-container") "compost-end"))))
    (mbutton 'no (lambda () (list (replace-fragment (get-id "compost-container") "compost-2"))))))

  (quick-fragment
   "compost-2"
   (vert
    (vert-colour 
     info-col
     (mtitle 'compost-2)
     (image-view (make-id "compost-pic") "compost_3" (layout 'fill-parent compost-image-height -1 'centre 0)))
    (mbutton 'yes (lambda () (list (replace-fragment (get-id "compost-container") "compost-3")))) 
    (mbutton 'no (lambda () (list (replace-fragment (get-id "compost-container") "compost-6"))))))

  (quick-fragment
   "compost-3"
   (vert
    (vert-colour 
     info-col
     (mtitle 'compost-3)
     (image-view (make-id "compost-pic") "compost_3" (layout 'fill-parent compost-image-height -1 'centre 0)))
    (mbutton 'yes (lambda () 
		   (set-current! 'compost-problem "There is probably too little moisture or too much brown material.")
		   (set-current! 'compost-solutions "(I) If it is winter, wait until summer and see if the problem resolves.<br>(II) Add more green materials, kitchen waste, grass clippings or leafy plant matter.<br>(III) Add an activator - comfrey leaves/liquid, dried blood, lime (ground limestone), nettle leaves, poultry manure or urine.")
		   (list (replace-fragment (get-id "compost-container") "compost-end"))))
    (mbutton 'no (lambda () (list (replace-fragment (get-id "compost-container") "compost-4"))))))

  (quick-fragment
   "compost-4"
   (vert
    (vert-colour 
     info-col
     (mtitle 'compost-4)
     (image-view (make-id "compost-pic") "compost_4" (layout 'fill-parent compost-image-height -1 'centre 0)))
    (mbutton 'yes (lambda () 
		   (set-current! 'compost-problem "There may be too much ventilation.")
		   (set-current! 'compost-solutions "If possible, try to make the sides of the compost bin solid.")
		   (list (replace-fragment (get-id "compost-container") "compost-end"))))
    (mbutton 'no (lambda () (list (replace-fragment (get-id "compost-container") "compost-5"))))))

  (quick-fragment
   "compost-5"
   (vert
    (vert-colour 
     info-col
     (mtitle 'compost-5)
     (image-view (make-id "compost-pic") "compost_5" (layout 'fill-parent compost-image-height -1 'centre 0)))
    (mbutton 'yes (lambda () 
		   (set-current! 'compost-problem "There may be too much ventilation.")
		   (set-current! 'compost-solutions "If possible, add a lid to stop it drying out. You could use old carpet, wood or thick cardboard.")
		   (list (replace-fragment (get-id "compost-container") "compost-end"))))
    (mbutton 'no (lambda () (list (replace-fragment (get-id "compost-container") "compost-6"))))))

  (quick-fragment
   "compost-6"
   (vert
    (vert-colour 
     info-col
     (mtitle 'compost-6)
     (image-view (make-id "compost-pic") "compost_6" (layout 'fill-parent compost-image-height -1 'centre 0)))
    (mbutton 'flies (lambda () 
		      (set-current! 'compost-problem "Too many flies")
		      (set-current! 'compost-solutions "Flies are a normal part of composting. If the numbers are troublesome, make sure the compost bin is not completely sealed, so they can escape.")
		      (list (replace-fragment (get-id "compost-container") "compost-end"))))
    (mbutton 'rats (lambda () 
		     (set-current! 'compost-problem "Rats")
		     (set-current! 'compost-solutions "Avoid putting cooked food, fish or meat on your compost.")
		     (list (replace-fragment (get-id "compost-container") "compost-end"))))
    (mbutton 'no (lambda () 
		   (set-current! 'compost-problem "Unknown problem")
		   (set-current! 'compost-solutions "We do not have your problem on our list yet, sorry!")
		   (list (replace-fragment (get-id "compost-container") "compost-end"))))))


  (fragment
   "compost-end"
   (vert
    (mtext 'problem)
    (vert-colour 
     info-col
     (text-view (symbol->id 'your-compost-problem)
		""
		large-text-size 
		(layout 'wrap-content 'wrap-content -1 'centre 20)))
    (mtext 'solution)
    (vert-colour 
     info-col
     (text-view (symbol->id 'your-compost-solution)
		""
		large-text-size 
		(layout 'wrap-content 'wrap-content -1 'centre 20)))
    
    (mbutton 'done (lambda () (list (finish-activity 1)))) 
    (mbutton 'restart (lambda () (list (replace-fragment (get-id "compost-container") "compost-1")))) 
    )
   
   (lambda (fragment arg)
     (activity-layout fragment))
   (lambda (fragment arg)
     (list
      (update-widget 'text-view (get-id "your-compost-problem") 'text 
		     (get-current 'compost-problem "No compost problem!"))
      (update-widget 'text-view (get-id "your-compost-solution") 'text 
		     (get-current 'compost-solutions "No compost solution!"))
      ))
   (lambda (fragment) '())
   (lambda (fragment) '())
   (lambda (fragment) '())
   (lambda (fragment) '()))

  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (choose l)
  (list-ref l (random (length l))))

(define (forg-state->frame state)
  (cond
   ((eqv? state 0) "forg_0")
   ((eqv? state 1) "forg_0")
   ((eqv? state 2) "forg_0")
   ((eqv? state 3) "forg_0")
   ((eqv? state 4) "forg_1")
   ((eqv? state 5) "forg_1")
   ((eqv? state 6) "forg_1")
   ((eqv? state 7) "forg_1")
   ((eqv? state 8) "forg_t0")
   ((eqv? state 9) "forg_t1")
   ((eqv? state 10) "forg_t2")
   ((eqv? state 11) "forg_t1")
   (else "forg_t0")))

(define (next-forg state)
  (cond
   ((eqv? state 7) (if (< (random 100) 10) 8 0))
   ((eqv? state 12) 0)
   (else (+ state 1))))

(define forg-state 0)

(define (next-forg-frame)
  (set! forg-state (next-forg forg-state))
  (forg-state->frame forg-state))

;;-------------

(define (robin-state->frame state)
  (cond
   ((eqv? state 0) "robin_2")
   ((eqv? state 1) "robin_1")
   ((eqv? state 2) "robin_2")
   ((eqv? state 3) "robin_1")
   ((eqv? state 4) "robin_2")
   ((eqv? state 5) "robin_1")
   ((eqv? state 6) "robin_2")
   (else "robin_1")))

(define (next-robin state)
  (cond
   ((eqv? state 0) (if (< (random 100) 2) 1 0))
   ((eqv? state 7) 0)
   (else (+ state 1))))
  
(define robin-state 0)

(define (next-robin-frame)
  (set! robin-state (next-robin robin-state))
  (robin-state->frame robin-state))

(define (anim-timer-cb)
  (list
   (update-widget 'image-view (get-id "robin") 'image (next-robin-frame))   
   (update-widget 'image-view (get-id "forg") 'image (next-forg-frame))   
   (delayed "anim-timer" 75 anim-timer-cb)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-activity-list

  (activity
   "splash"
   (scroll-view-vert
    0 (layout 'fill-parent 'wrap-content 0.75 'centre 0)
    (list
     (vert
      (mtitle 'splash-title)
      (mtext-margin 'splash-text 20)
      (mtext-margin 'splash-blurb 20)
      (image-view (make-id "splash") "logo" (layout 'fill-parent 'wrap-content -1 'centre 0))
      (mbutton 'splash-start (lambda () (list (start-activity "main" 0 ""))))
      (mtext-margin 'splash-discl 20)
      )
     ))

   (lambda (activity arg)
     (activity-layout activity))
   (lambda (activity arg) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity requestcode resultcode) '()))
  
  (activity
   "main"
   (scroll-view-vert
    0 (layout 'fill-parent 'wrap-content 0.75 'centre 0)
    (list

     (vert
      (mtitle 'title)
      ;; image
      (image-view (make-id "map") "map" (layout 'fill-parent 'wrap-content -1 'centre 0))
      
      (horiz
       (vert
	(mtext 'soil-texture)
	(mbutton 'soil-texture-but (lambda () (list (start-activity "calc" 0 "")))))
       (vert
	(mtext 'soil-ph)
	(mbutton 'soil-ph-but (lambda () '()))))
      (horiz
       (vert
	(mtext 'units)
	(mbutton 'units-but (lambda () '())))
       (vert
	(mtext 'rainfall)
	(mbutton 'rainfall-but (lambda () '()))))
      
      (mbutton 'compost-lab (lambda () (list (start-activity "fieldcalc" 0 ""))))

      (mtext 'recommended-crops)
      (infotext-robin 'recommended-crops-text)
      (mtext 'todo)
      (infotext-forg 'todo-text)
      )))
   (lambda (activity arg)
     (activity-layout activity))
   (lambda (activity arg)
     (list
      (update-widget 'button (get-id "soil-ph-but") 'disabled 1)
      (update-widget 'button (get-id "units-but") 'disabled 1)
      (update-widget 'button (get-id "rainfall-but") 'disabled 1)
      (update-widget 'button (get-id "soil-texture-but") 'text (get-current 'soil-result "Find soil texture"))
      (delayed "anim-timer" (+ 100 (random 50)) anim-timer-cb)
      ))
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity requestcode resultcode) '()))


  (activity
   "calc" ;; soil lab
    (scroll-view-vert
     0 (layout 'fill-parent 'wrap-content 0.75 'centre 0)
     (list

      (vert
       (mtitle 'soil-title)
       (mtext-margin 'soil-text 20)
       (build-fragment "soil-1" (make-id "soil-container") (layout 'fill-parent 'wrap-content -1 'left 0))
       )))
       
   (lambda (activity arg)
     (activity-layout activity))
   (lambda (activity arg)
     (list))
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity requestcode resultcode) '()))

  (activity
   "fieldcalc" ;; compost lab
   (scroll-view-vert
    0 (layout 'fill-parent 'wrap-content 0.75 'centre 0)
    (list
     
     (vert
      (mtitle 'compost-title)
      (mtext-margin 'compost-text 20)
      (mbutton 'new-bin (lambda () '()))
      (spacer 10)
      (mbutton 'left-bin (lambda () (list (start-activity "newfield" 1 ""))))
      (mbutton 'middle-bin (lambda () (list (start-activity "newfield" 1 ""))))
      (mbutton 'right-bin (lambda () (list (start-activity "newfield" 1 ""))))
      (image-view (make-id "forg") "forg_0" 
		  (layout 170 'wrap-content 1 'left 
			  '(0 -60 0 0)))
      (mtext 'compost-tips)
      (mbutton 'compost-troubleshooting (lambda () (list (start-activity "fieldhistory" 1 ""))))
      (mbutton 'compost-type (lambda () '()))
      (mbutton 'compost-what (lambda () '()))
      (mbutton 'compost-maintenance (lambda () '()))
      (mbutton 'compost-using (lambda () '()))
      (spacer 10)
      (image-view (make-id "robin") "robin_1" 
		  (layout 120 'wrap-content 1 'right 
			  '(0 -60 0 0)))
      (mbutton 'back (lambda () (list (finish-activity 1))))
      
      )))
   
   (lambda (activity arg)
     (activity-layout activity))
   (lambda (activity arg)
     (list
      (delayed "anim-timer" (+ 100 (random 50)) anim-timer-cb)
      (update-widget 'button (get-id "new-bin") 'disabled 1)
      (update-widget 'button (get-id "middle-bin") 'disabled 1)
      (update-widget 'button (get-id "right-bin") 'disabled 1)
      (update-widget 'button (get-id "compost-type") 'disabled 1)
      (update-widget 'button (get-id "compost-what") 'disabled 1)
      (update-widget 'button (get-id "compost-maintenance") 'disabled 1)
      (update-widget 'button (get-id "compost-using") 'disabled 1)
      ))
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity requestcode resultcode) '()))

  (activity
   "newfield" ;; bin page
   (scroll-view-vert
    0 (layout 'fill-parent 'wrap-content 0.75 'centre 0)
    (list     
     (vert
      (mtitle 'bin-title)
      (mbutton 'add-material (lambda () (list (start-activity "field" 1 ""))))
      (mtext-margin 'bin-text 20)
      (mtext 'bin-ratio)
      (infotext 'ratio-but)
      (mtext 'bin-ratio2)
      (infotext 'ratio-but2)
      (mtext 'bin-tip)
      (infotext-forg 'bin-info)
      (mbutton 'back (lambda () (list (finish-activity 1))))
      )))
   
   (lambda (activity arg)
     (activity-layout activity))
   (lambda (activity arg)
     (anim-timer-cb))
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity requestcode resultcode) '()))

  (activity
   "field" ;; add material 
   (scroll-view-vert
    0 (layout 'fill-parent 'wrap-content 0.75 'centre 0)
    (list
   
     (vert
      (mtitle 'material-title)
      (mtext-margin 'add-text 20)
      (mtext 'add-mat-text)
      (mbutton 'add-mat-but (lambda () '()))
      (mtext 'add-containers-text)
      (mbutton 'add-containers-but (lambda () '()))
      (mtext 'add-ratio)
      (infotext 'add-ratio-amount)
      (horiz
       (mbutton-scale 'save (lambda () (list (finish-activity 1))))
       (mbutton-scale 'back (lambda () (list (finish-activity 1)))))
      )))
   
   (lambda (activity arg)
     (activity-layout activity))
   (lambda (activity arg)
     (list
      (update-widget 'button (get-id "add-mat-but") 'disabled 1)
      (update-widget 'button (get-id "add-containers-but") 'disabled 1)
      ))
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity requestcode resultcode) '()))

  (activity
   "fieldhistory" ;; compost troubleshooting 
   
   (scroll-view-vert
     0 (layout 'fill-parent 'wrap-content 0.75 'centre 0)
     (list
      (vert
       (mtitle 'trouble-title)
       (mtext-margin 'trouble-text 20)
       (build-fragment "compost-1" (make-id "compost-container") (layout 'fill-parent 'wrap-content -1 'left 0))
       )))

   
   (lambda (activity arg)
     (activity-layout activity))
   (lambda (activity arg)
     (list))
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity requestcode resultcode) '()))
      

  )
