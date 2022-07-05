(define app (new PIXI.Application
		 &(:backgroundColor "0x1099"
	           :width "400"
		   :height "250")))

(define (create-text name x y)
  (define t (new PIXI.Text name)) 
  (set! t.x x) 
  (set! t.y y)
  (app.stage.addChild t)
 t)

(define duck (create-text "🦆" 150 150))
(set! duck.scale.x 2)
(set! duck.scale.y 2)

(define (move-left s)
  (set! s.x (- s.x 5)))
(define (move-right s)
  (set! s.x (+ s.x 5)))
(define (flip s)
  (set! s.scale.x (* s.scale.x -1))) 

(define (set-dir)
  (flip duck)
  (set! dir (* dir -1)))

(define dir 1) 
(define (tick d)
  (cond ((eq? dir 1) (move-left duck))
	((eq? dir -1) (move-right duck)))
  (cond ((and (eq? dir 1) (< duck.x 50))
	 (set-dir))
	((and (eq? dir -1) (> duck.x 300))
	 (set-dir))))

(set! app.ticker.maxFPS 1)
(app.ticker.add tick)
(document.body.prepend app.view)
    
