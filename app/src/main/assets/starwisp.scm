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

(msg "starwisp.scm")

(setup-database!)

;;(set-current! 'user-id (get-setting-value "user-id"))
;;(set! i18n-lang (get-setting-value "language"))

(define zoom-out 4)
(define zoom-in 16)

(define centre-layout (layout 'wrap-content 'wrap-content 1 'centre 0))

(define info-col (list #xb0 #xd1 #xc1 #xff))


(define (infotext id)
  (vert-colour 
   info-col
   (text-view (symbol->id id)
	      (mtext-lookup id)
	      large-text-size 
	      (layout 'wrap-content 'wrap-content -1 'centre 10))))
  
(define-fragment-list
  (fragment
   "soil-1"
   (vert
    (vert-colour 
     info-col
     (mtitle 'soil-1)
     (image-view (make-id "soil-pic") "soil_1" (layout 'fill-parent 'wrap-contant -1 'centre 0)))
    (mbutton 'easily (lambda () (list (replace-fragment (get-id "soil-container") "soil-3"))))
    (mbutton 'great-care (lambda () (list (replace-fragment (get-id "soil-container") "soil-2"))))
    (mbutton 'no (lambda () 
		   (set-current! 'soil-result "Sand")
		   (list (replace-fragment (get-id "soil-container") "soil-end")))) 
    )
   (lambda (fragment arg)
     (activity-layout fragment))
   (lambda (fragment arg)
     (list))
   (lambda (fragment) '())
   (lambda (fragment) '())
   (lambda (fragment) '())
   (lambda (fragment) '()))

  (fragment
   "soil-2"
   (vert
    (vert-colour 
     info-col
     (mtitle 'soil-2)
     (image-view (make-id "soil-pic") "soil_2" (layout 'fill-parent 'wrap-contant -1 'centre 0)))
    (mbutton 'flattens (lambda () (list (replace-fragment (get-id "soil-container") "soil-3"))))
    (mbutton 'breaks (lambda () 
		       (set-current! 'soil-result "Sandy loam")
		       (list (replace-fragment (get-id "soil-container") "soil-end")))) 
    )

   (lambda (fragment arg)
     (activity-layout fragment))
   (lambda (fragment arg)
     (list))
   (lambda (fragment) '())
   (lambda (fragment) '())
   (lambda (fragment) '())
   (lambda (fragment) '()))

  (fragment
   "soil-3"
   (vert
    (vert-colour 
     info-col
     (mtitle 'soil-3)
     (image-view (make-id "soil-pic") "soil_3" (layout 'fill-parent 'wrap-contant -1 'centre 0)))
    (mbutton 'yes (lambda () (list (replace-fragment (get-id "soil-container") "soil-4"))))
    (mbutton 'no (lambda ()
		   (set-current! 'soil-result "Loamy sand")
		   (list (replace-fragment (get-id "soil-container") "soil-end")))) 
    )

   (lambda (fragment arg)
     (activity-layout fragment))
   (lambda (fragment arg)
     (list))
   (lambda (fragment) '())
   (lambda (fragment) '())
   (lambda (fragment) '())
   (lambda (fragment) '()))

  (fragment
   "soil-4"
   (vert
    (vert-colour 
     info-col
     (mtitle 'soil-4)
     (image-view (make-id "soil-pic") "soil_4" (layout 'fill-parent 'wrap-contant -1 'centre 0)))
    (mbutton 'yes (lambda () (list (replace-fragment (get-id "soil-container") "soil-6"))))
    (mbutton 'no (lambda () (list (replace-fragment (get-id "soil-container") "soil-5")))) ;; SANDY LOAM
    )

   (lambda (fragment arg)
     (activity-layout fragment))
   (lambda (fragment arg)
     (list))
   (lambda (fragment) '())
   (lambda (fragment) '())
   (lambda (fragment) '())
   (lambda (fragment) '()))

  (fragment
   "soil-5"
   (vert
    (vert-colour 
     info-col
     (mtitle 'soil-5)
     (image-view (make-id "soil-pic") "soil_5" (layout 'fill-parent 'wrap-contant -1 'centre 0)))
    (mbutton 'smooth (lambda () 
		       (set-current! 'soil-result "Silty loam")
		       (list (replace-fragment (get-id "soil-container") "soil-end")))) 
    (mbutton 'rough (lambda () 
		      (set-current! 'soil-result "Sandy silt loam")
		      (list (replace-fragment (get-id "soil-container") "soil-end")))) 
    )

   (lambda (fragment arg)
     (activity-layout fragment))
   (lambda (fragment arg)
     (list))
   (lambda (fragment) '())
   (lambda (fragment) '())
   (lambda (fragment) '())
   (lambda (fragment) '()))

  (fragment
   "soil-6"
   (vert
    (vert-colour 
     info-col
     (mtitle 'soil-6)
     (image-view (make-id "soil-pic") "soil_6" (layout 'fill-parent 'wrap-contant -1 'centre 0)))
    (mbutton 'yes (lambda () (list (replace-fragment (get-id "soil-container") "soil-8"))))
    (mbutton 'no (lambda ()  (list (replace-fragment (get-id "soil-container") "soil-7")))) ;; SANDY LOAM
    )

   (lambda (fragment arg)
     (activity-layout fragment))
   (lambda (fragment arg)
     (list))
   (lambda (fragment) '())
   (lambda (fragment) '())
   (lambda (fragment) '())
   (lambda (fragment) '()))

  (fragment
   "soil-7"
   (vert
    (vert-colour 
     info-col
     (mtitle 'soil-7)
     (image-view (make-id "soil-pic") "soil_7" (layout 'fill-parent 'wrap-contant -1 'centre 0)))
    (mbutton 'gritty (lambda ()
		       (set-current! 'soil-result "Sandy clay loam")
		       (list (replace-fragment (get-id "soil-container") "soil-end")))) 
    (mbutton 'mod-rough (lambda () 
			  (set-current! 'soil-result "Clay loam")
			  (list (replace-fragment (get-id "soil-container") "soil-end")))) 
    (mbutton 'doughy (lambda () 
		       (set-current! 'soil-result "Silty clay loam")
		       (list (replace-fragment (get-id "soil-container") "soil-end")))) 
    )

   (lambda (fragment arg)
     (activity-layout fragment))
   (lambda (fragment arg)
     (list))
   (lambda (fragment) '())
   (lambda (fragment) '())
   (lambda (fragment) '())
   (lambda (fragment) '()))

  (fragment
   "soil-8"
   (vert
    (vert-colour 
     info-col
     (mtitle 'soil-8)
     (image-view (make-id "soil-pic") "soil_8" (layout 'fill-parent 'wrap-contant -1 'centre 0)))
    (mbutton 'polish-yes (lambda () (list (replace-fragment (get-id "soil-container") "soil-9"))))
    (mbutton 'polish-gritty (lambda ()
			      (set-current! 'soil-result "Sandy clay")
			      (list (replace-fragment (get-id "soil-container") "soil-end")))) 
    )

   (lambda (fragment arg)
     (activity-layout fragment))
   (lambda (fragment arg)
     (list))
   (lambda (fragment) '())
   (lambda (fragment) '())
   (lambda (fragment) '())
   (lambda (fragment) '()))

  (fragment
   "soil-9"
   (vert
    (vert-colour 
     info-col
     (mtitle 'soil-9)
     (image-view (make-id "soil-pic") "soil_9" (layout 'fill-parent 'wrap-contant -1 'centre 0)))
    (mbutton 'very-strongly (lambda () 
			      (set-current! 'soil-result "Clay")
			      (list (replace-fragment (get-id "soil-container") "soil-end")))) 
    (mbutton 'moderately (lambda () 
			   (set-current! 'soil-result "Silty clay")
			   (list (replace-fragment (get-id "soil-container") "soil-end")))) 
    )

   (lambda (fragment arg)
     (activity-layout fragment))
   (lambda (fragment arg)
     (list))
   (lambda (fragment) '())
   (lambda (fragment) '())
   (lambda (fragment) '())
   (lambda (fragment) '()))

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
      (update-widget 'text-view (get-id "your-soil-result") 'text (get-current 'soil-result "No soil result!"))
      ))
   (lambda (fragment) '())
   (lambda (fragment) '())
   (lambda (fragment) '())
   (lambda (fragment) '()))


  )


(define-activity-list

  (activity
   "main"
   (scroll-view-vert
    0 (layout 'fill-parent 'wrap-content 0.75 'centre 0)
    (list

     (vert
      (mtitle 'title)
      ;; image
      (image-view (make-id "map") "map" (layout 'fill-parent 'wrap-contant -1 'centre 0))
      
      (horiz
       (vert
	(mtext 'soil-texture)
	(mbutton 'soil-texture-but (lambda (v) '())))
       (vert
	(mtext 'soil-ph)
	(mbutton 'soil-ph-but (lambda (v) '()))))
      (horiz
       (vert
	(mtext 'units)
	(mbutton 'units-but (lambda (v) '())))
       (vert
	(mtext 'rainfall)
	(mbutton 'rainfall-but (lambda (v) '()))))
      
      (mbutton 'compost-lab (lambda () '()))
      (mbutton 'soil-lab (lambda () (list (start-activity "calc" 0 ""))))
      
      (mtext 'recommended-crops)
      (infotext 'recommended-crops-text)
      (mtext 'todo)
      (infotext 'todo-text)
      )))
   (lambda (activity arg)
     (activity-layout activity))
   (lambda (activity arg)
     (list
      (update-widget 'button (get-id "soil-texture-but") 'disabled 1)
      (update-widget 'button (get-id "soil-ph-but") 'disabled 1)
      (update-widget 'button (get-id "units-but") 'disabled 1)
      (update-widget 'button (get-id "rainfall-but") 'disabled 1)
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
       (mtext 'soil-text)
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
      

  )
