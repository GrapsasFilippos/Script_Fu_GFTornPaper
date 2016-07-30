(define
  (gf-batch-torn-paper inFileNameI inFileNameO)
  (let*
    (
      (theImage (car (gimp-file-load RUN-NONINTERACTIVE inFileNameI inFileNameI ) ) )
      (theDrawable (car (gimp-image-get-active-layer theImage) ) )
      (theResults (script-fu-gf-torn-paper theImage theDrawable) )
      (rImage (car theResults) )
      (rLayer (car (cdr theResults) ) )
    )
    
    (gimp-file-save RUN-NONINTERACTIVE rImage rLayer inFileNameO inFileNameO)
    
  )
)
