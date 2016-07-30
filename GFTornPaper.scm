;;

(script-fu-register
  "script-fu-gf-torn-paper"
  "GF Torn Paper"
  "Tor Paper effect."
  "Filippos A. Grapsas"
  "copyright 2016, Filippos A. Grapsas;\
  GPL-v3"
  "July 31, 2016"
  "RGB*"
  SF-IMAGE "An image" 0
  SF-DRAWABLE "A drawable" 0
)

(script-fu-menu-register "script-fu-gf-torn-paper" "<Image>/Filters")


(define
  (script-fu-gf-torn-paper inImage inDrawable)
  (let*
    (
      (tuLayer (car (gimp-layer-copy inDrawable TRUE) ) )
      (greyLayer 0)
      (oldBG (car (gimp-palette-get-background ) ) )
      (oldFG (car (gimp-palette-get-foreground ) ) )
    )
    (gimp-image-undo-group-start inImage)
    
    (gimp-context-set-background '(0 0 0) )
    (gimp-context-set-foreground '(225 225 225) )
    
    
;;     (gimp-layer-set-visible inDrawable FALSE)
    (gimp-image-remove-layer inImage inDrawable)
    
    (gimp-image-add-layer inImage tuLayer 0)
    (gimp-layer-set-name tuLayer "Torn Out")
    (gimp-image-select-item inImage CHANNEL-OP-REPLACE tuLayer)
    (script-fu-distress-selection inImage tuLayer
      230 ;; Threshold
      8   ;; Spread
      4   ;; Granularity
      2   ;; Smooth
      1   ;; Smooth horizontally
      1   ;; Smooth vertically
    )
    
    (set! greyLayer
      (car
        (gimp-layer-new
          inImage
          (car (gimp-image-width inImage) )
          (car (gimp-image-height inImage) )
          RGB-IMAGE
          "Grey"
          100
          NORMAL-MODE
        )
      )
    )
    (gimp-layer-add-alpha greyLayer)
    (gimp-drawable-fill greyLayer TRANSPARENT-FILL)
    (gimp-image-add-layer inImage greyLayer 0)
    (gimp-selection-invert inImage)
    (gimp-selection-grow inImage 4)
    (gimp-edit-fill greyLayer FOREGROUND-FILL)
    
    (gimp-selection-invert inImage)
    (gimp-selection-grow inImage 4)
    (gimp-selection-invert inImage)
    
    (gimp-edit-clear greyLayer)
    (gimp-edit-clear tuLayer)
    (gimp-selection-none inImage)
    
    (set! tuLayer (car (gimp-image-merge-visible-layers inImage EXPAND-AS-NECESSARY) ) )
    (script-fu-drop-shadow
      inImage
      tuLayer
      0  ;; Offset X
      0  ;; Offset Y
      30 ;; Blur radius
      '(0 0 0) ;; Color
      100 ;; Opacity
      TRUE ;; Allow resizing
    )
    (set! tuLayer (car (gimp-image-merge-visible-layers inImage EXPAND-AS-NECESSARY) ) )
    (plug-in-autocrop RUN-INTERACTIVE inImage tuLayer)
    (gimp-layer-set-name tuLayer "Torn Out")
    
    
    (gimp-context-set-background oldBG )
    (gimp-context-set-foreground oldFG )
    
    (gimp-displays-flush)
    (gimp-image-clean-all inImage)
    (gimp-undo-push-group-end inImage)
    
    (list inImage tuLayer)
  )
)
